import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/domain/location/location.dart';
import 'package:albalarma/infrastructure/location/location_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@Injectable()
class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState.initial());

  final LocationRepository _locationRepository = getIt<LocationRepository>();

  Future<void> getPichilemu() async {
    final location = await _locationRepository.getPichilemuSuntimes();
    try {
      emit(LocationState.requesting());
      emit(LocationState.loaded(location));
    } catch (err) {
      emit(LocationState.error(
          "Couldn't fetch location. Is the device online?", location));
    }
  }

  Future<void> getLocation() async {
    emit(LocationState.requesting());
    final location = await _locationRepository.getCurrentLocationSuntimes();
    try {
      emit(LocationState.loaded(location));
    } catch (err) {
      emit(LocationState.error(
          "Couldn't fetch location. Is the device online?", location));
    }
  }

  Future<void> reFetchSuntimes(Location location) async {
    try {
      emit(LocationState.requesting());
      emit(LocationState.loaded(
          await _locationRepository.reFetchSuntimes(location)));
    } catch (err) {
      emit(LocationState.error(
          "Couldn't fetch location. Is the device online?", location));
    }
  }
}
