import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'audio_state.dart';
part 'audio_cubit.freezed.dart';

@Injectable()
class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioState.initial());

  Future<void> setRadio(String radio) async {
    emit(AudioState.loading());
  }
}
