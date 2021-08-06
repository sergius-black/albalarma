import 'package:albalarma/dependency_injection/injection.dart';
import 'package:albalarma/presentation/common/app_icon.dart';
import 'package:audio_service/audio_service.dart';
import "package:flutter/material.dart";

class Radio extends StatefulWidget {
  const Radio({Key? key}) : super(key: key);

  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  final _audioHandler = getIt<AudioHandler>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [Text("Radio"), Spacer(), AppIconWidget(imageSize: 30)],
          ),
          // actions: [AppIconWidget(imageSize: 10)],
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("Futuro"),
                          child: Text("Futuro"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("BioBio"),
                          child: Text("BioBio"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("ADN"),
                          child: Text("ADN"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("Rock&Pop"),
                          child: Text("Rock&Pop"),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("Cooperativa"),
                          child: Text("Cooperativa"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await _audioHandler.customAction("Concierto"),
                          child: Text("Concierto"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () async => await _audioHandler.stop(),
                        icon: Icon(Icons.stop),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () async => await _audioHandler.play(),
                        icon: Icon(Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
