// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:audio_service/audio_service.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/alarm/cubit/alarm_cubit.dart' as _i3;
import '../application/audio/cubit/audio_cubit.dart' as _i4;
import '../application/location/location_cubit.dart' as _i5;
import '../infrastructure/alarm_service/alarm_repository.dart' as _i7;
import '../infrastructure/audio_service/audio_handler.dart' as _i9;
import '../infrastructure/local_db/local_db_repository.dart' as _i10;
import '../infrastructure/location/location_repository.dart' as _i11;
import '../infrastructure/remote_api/dio.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AlarmCubit>(() => _i3.AlarmCubit());
  gh.factory<_i4.AudioCubit>(() => _i4.AudioCubit());
  gh.factory<_i5.LocationCubit>(() => _i5.LocationCubit());
  gh.factory<_i6.RemoteAPI>(() => _i6.RemoteAPI());
  gh.singleton<_i7.AlarmRepository>(_i7.AlarmRepository());
  gh.singletonAsync<_i8.AudioHandler>(
      () => _i9.AlbalarmaAudioHandler.initAudioService());
  gh.singleton<_i10.LocalDatabase>(_i10.LocalDatabase());
  gh.singleton<_i11.LocationRepository>(_i11.LocationRepository());
  return get;
}
