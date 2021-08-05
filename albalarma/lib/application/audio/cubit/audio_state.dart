part of 'audio_cubit.dart';

@freezed
abstract class AudioState with _$AudioState {
  const factory AudioState.initial() = AudioInitial;
  const factory AudioState.idle() = Idle;
  const factory AudioState.loading() = Loading;
  const factory AudioState.playing() = Playing;
  const factory AudioState.paused() = Paused;
  const factory AudioState.error() = Error;
}
