import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

@Singleton(as: AudioHandler)
class AlbalarmaAudioHandler extends BaseAudioHandler {
  @factoryMethod
  static Future<AudioHandler> initAudioService() async {
    print("Initializing audio handler service");

    return await AudioService.init(
      builder: () => AlbalarmaAudioHandler(),
      config: AudioServiceConfig(
        androidNotificationChannelId: 'io.reaqtor.albalarma.channel.audio',
        androidNotificationChannelName: 'Albalarma',
        androidNotificationOngoing: true,
        // androidStopForegroundOnPause: true,
      ),
    );
  }

  final _player = AudioPlayer();

  final List<MediaItem> _radiosMediaItems = [
    MediaItem(
      id: "FuturoId",
      album: "Despierta Mierda",
      title: "Radio Futuro",
      extras: {'url': "https://20833.live.streamtheworld.com/FUTUROAAC_SC"},
    ),
    MediaItem(
      id: "BioBioId",
      album: "Despierta Mierda",
      title: "Radio Biobio",
      extras: {
        'url': "https://unlimited3-cl.dps.live/biobiosantiago/aac/icecast.audio"
      },
    ),
    MediaItem(
      id: "ADNId",
      album: "Despierta Mierda",
      title: "Radio ADN",
      extras: {'url': "https://21933.live.streamtheworld.com/ADN_SC"},
    ),
    MediaItem(
      id: "RockAndPopId",
      album: "Despierta Mierda",
      title: "Radio Rock&Pop",
      extras: {'url': "https://20323.live.streamtheworld.com/ROCK_AND_POP_SC"},
    ),
    MediaItem(
      id: "CooperativaId",
      album: "Despierta Mierda",
      title: "Radio Cooperativa",
      extras: {
        'url': "https://unlimited11-cl.dps.live/cooperativafm/mp3/icecast.audio"
      },
    ),
    MediaItem(
      id: "ConciertoId",
      album: "Despierta Mierda",
      title: "Radio Concierto",
      extras: {'url': "https://24483.live.streamtheworld.com/CONCIERTOAAC_SC"},
    )
  ];

  AlbalarmaAudioHandler() {
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    notifyAudioHandlerAboutPlaybackEvents();
    try {
      print("Audio service handler loaded");
      // await _player.setAudioSource(_audioSource);
      // _player.play();
    } catch (e) {
      print("Error: $e");
    }
  }

  void notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          MediaControl.skipToNext,
        ],
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        repeatMode: const {
          LoopMode.off: AudioServiceRepeatMode.none,
          LoopMode.one: AudioServiceRepeatMode.one,
          LoopMode.all: AudioServiceRepeatMode.all,
        }[_player.loopMode]!,
        shuffleMode: (_player.shuffleModeEnabled)
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  UriAudioSource _createAudioSource(MediaItem mediaItem) {
    return AudioSource.uri(
      Uri.parse(mediaItem.extras!['url']),
    );
  }

  @override
  Future customAction(String radio, [Map<String, dynamic>? extras]) async {
    _player.stop();

    switch (radio) {
      case "Futuro":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[0]));
        break;
      case "BioBio":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[1]));
        break;
      case "ADN":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[2]));
        break;
      case "Rock&Pop":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[3]));
        break;
      case "Cooperativa":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[4]));
        break;
      case "Concierto":
        _player.setAudioSource(_createAudioSource(_radiosMediaItems[5]));
        break;
    }
    _player.play();
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  // @override
  // Future<void> skipToQueueItem(int index) async {
  //   if (index < 0 || index >= queue.value.length) return;
  //   _player.seek(Duration.zero, index: index);
  // }

  @override
  Future<void> skipToNext() async {
    await _skip(1);
  }

  @override
  Future<void> skipToPrevious() async {
    await _skip(-1);
  }

  Future<void> _skip(int offset) async {
    final queue = this.queue.value;
    final index = playbackState.value.queueIndex ?? -1;
    if (index < 0 || index >= queue.length) return;
    return skipToQueueItem(index + offset);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }
}
