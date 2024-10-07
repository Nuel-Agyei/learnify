import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  String path = String.fromCharCode(0);
  final AudioRecorder recorder = AudioRecorder();
  final AudioPlayer play = AudioPlayer();

  Future<void> record() async {
    try {
      if(await recorder.hasPermission()){
      await recorder.start(const RecordConfig(), path: path);
      }
    } catch (e) {
      debugPrint("Error starting recording: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      await recorder.stop();
      recorder.dispose();
    } catch (e) {
      debugPrint("Error stopping recording: $e");
    }
  }

  Future<void> player() async {
    try {
      await play.play(UrlSource(path));
    } catch (e) {
      debugPrint("Error playing/stopping audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
                onPressed: () {
                  record();
                },
                child: Text('Record')
                ),
            TextButton(
                onPressed: () {
                  print('paused');
                  stopRecording();
                  recorder.isPaused().then((isPaused) {
                    if (isPaused) {
                      print('paused');
                    }
                  });
                },
                child: Text('Stop Recording'),),
            TextButton(
                onPressed: () {
                  player();
                },
                child: Text('Play')),
          ],
        ),
      ),
    );
  }
}
