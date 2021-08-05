import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/alarm/alarm.dart';
import 'package:albalarma/infrastructure/alarm_service/alarm_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alarm_state.dart';
part 'alarm_cubit.freezed.dart';

@Injectable()
class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmState.initial());

  AlarmRepository _alarmRepository = getIt<AlarmRepository>();

  Future<void> checkAlarm() async {
    try {
      emit(AlarmState.off(_alarmRepository.alarm));
    } catch (err) {
      emit(AlarmState.error());
    }
  }

  Future<void> setSunriseTime(DateTime sunrise) async {
    try {
      _alarmRepository.setSunriseTime = sunrise;
      emit(AlarmState.off(_alarmRepository.alarm));
    } catch (err) {
      print(err);
      emit(AlarmState.error());
    }
  }

  Future<void> setTimeOffset(int offset) async {
    try {
      _alarmRepository.setAlarmOffset = offset;
      emit(AlarmState.off(_alarmRepository.alarm));
    } catch (err) {
      print(err);
      emit(AlarmState.error());
    }
  }

  Future<void> setAlarmRadio({required String radio}) async {
    try {
      _alarmRepository.setRadio = radio;
      emit(AlarmState.off(_alarmRepository.alarm));
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
      bool orchestratorSetted = await _alarmRepository.setOrchestrator();
      if (alarmSetted && orchestratorSetted) {
        emit(AlarmState.setted(_alarmRepository.alarm));
      } else {
        emit(AlarmState.error());
      }
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
        emit(AlarmState.setted(_alarmRepository.alarm));
      } else {
        emit(AlarmState.error());
      }
    } catch (err) {
      print(err);

      emit(AlarmState.error());
    }
  }

  Future<void> cancelAlarms() async {
    try {
      _alarmRepository.cancelAll();
      emit(AlarmState.off(_alarmRepository.alarm));
    } catch (err) {
      emit(AlarmState.error());
    }
  }
}
