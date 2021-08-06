import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/infrastructure/alarm_service/alarm_repository.dart';
import 'package:albalarma/infrastructure/local_db/local_db_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alarm_state.dart';
part 'alarm_cubit.freezed.dart';

@Injectable()
class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmState.initial());

  AlarmRepository _alarmRepository = getIt<AlarmRepository>();
  LocalDatabase _db = getIt<LocalDatabase>();

  Future<void> getCurrentAlarmStatus() async {
    try {
      Alarm currentAlarm = _db.getCurrentAlarm() ?? Alarm.empty();
      _alarmRepository.setRadio = currentAlarm.radio;
      int currentOffset = await _db.getAlarmOffset();
      bool orchestratorState = await _db.getOrchestratorStatus();
      DateTime todaySunrise = (await _db.getTodaySuntimes()).sunrise;
      DateTime tomorrowSunrise = (await _db.getTomorrowSuntimes()).sunrise;

      _alarmRepository.setSunriseTime = DateTime.now().isBefore(todaySunrise)
          ? todaySunrise
          : tomorrowSunrise;

      if (currentAlarm != Alarm.empty() &&
          currentAlarm.alarmTime!.isAfter(DateTime.now())) {
        emit(AlarmState.setted(currentAlarm, currentOffset, orchestratorState));
      } else if (currentAlarm == Alarm.empty()) {
        emit(AlarmState.off(
            currentAlarm.copyWith(alarmTime: DateTime.now()), currentOffset));
      }
      emit(AlarmState.off(currentAlarm, currentOffset));
    } catch (err) {
      emit(AlarmState.error());
    }
  }

  Future<void> checkAlarm() async {
    int currentOffset = await _db.getAlarmOffset();

    try {
      emit(AlarmState.off(_alarmRepository.alarm, currentOffset));
    } catch (err) {
      emit(AlarmState.error());
    }
  }

  Future<void> setSunriseTime(DateTime sunrise) async {
    int currentOffset = await _db.getAlarmOffset();
    try {
      _alarmRepository.setSunriseTime = sunrise;
      emit(AlarmState.off(_alarmRepository.alarm, currentOffset));
    } catch (err) {
      print(err);
      emit(AlarmState.error());
    }
  }

  Future<void> setTimeOffset(int offset) async {
    try {
      _alarmRepository.setAlarmOffset = offset;
      emit(AlarmState.off(_alarmRepository.alarm, _alarmRepository.timeOffset));
    } catch (err) {
      print(err);
      emit(AlarmState.error());
    }
  }

  Future<void> setAlarmRadio({required String radio}) async {
    try {
      _alarmRepository.setRadio = radio;
      emit(AlarmState.off(_alarmRepository.alarm, _alarmRepository.timeOffset));
    } catch (err) {
      print(err);

      emit(AlarmState.error());
    }
  }

  Future<void> setAlarm() async {
    try {
      emit(AlarmState.setting());
      bool alarmSetted =
          await _alarmRepository.setAlarm(_alarmRepository.alarmTime);
      await _db.setAlarmOffset(_alarmRepository.timeOffset);
      await _db.saveAlarm(_alarmRepository.alarm);
      await _db.setOrchestratorStatus(false);
      // bool orchestratorSetted = await _alarmRepository.setOrchestrator();

      if (alarmSetted) {
        emit(AlarmState.setted(
            _alarmRepository.alarm, _alarmRepository.timeOffset, false));
      } else {
        emit(AlarmState.error());
      }
    } catch (err) {
      print(err);

      emit(AlarmState.error());
    }
  }

  Future<void> switchOrchestratorStatus() async {
    // emit(AlarmState.setting());
    try {
      bool orchestratorCurrentStatus = await _db.getOrchestratorStatus();
      Alarm alarm = _db.getCurrentAlarm()!;
      int offset = await _db.getAlarmOffset();

      if (orchestratorCurrentStatus) {
        _alarmRepository.cancelOrchestrator();
        await _db.setOrchestratorStatus(false);
      } else {
        await _alarmRepository.setOrchestrator();
        await _db.setOrchestratorStatus(true);
      }
      emit(AlarmState.setted(alarm, offset, !orchestratorCurrentStatus));
      return;
    } catch (err) {
      print(err);
      emit(AlarmState.error());
    }
  }

  Future<void> setEnsayo() async {
    try {
      emit(AlarmState.setting());
      bool setted = await _alarmRepository.setEnsayo();
      if (setted) {
        emit(AlarmState.setted(
            _alarmRepository.alarm, _alarmRepository.timeOffset, true));
      } else {
        emit(AlarmState.error());
      }
    } catch (err) {
      print(err);

      emit(AlarmState.error());
    }
  }

  Future<void> cancelAlarms() async {
    int currentOffset = await _db.getAlarmOffset();
    try {
      _alarmRepository.cancelAll();
      emit(AlarmState.off(_db.getCurrentAlarm()!, currentOffset));
    } catch (err) {
      emit(AlarmState.error());
    }
  }
}
