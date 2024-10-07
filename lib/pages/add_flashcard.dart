import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnify/db/entity/remote/db.dart';
import 'package:learnify/pages/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart'; // Keep this import as per your request
import 'package:path_provider/path_provider.dart';

class AddFlashcard extends StatefulWidget {
  const AddFlashcard({super.key});

  @override
  State<AddFlashcard> createState() => _AddFlashcardState();
}

class _AddFlashcardState extends State<AddFlashcard> {
  bool isRecording = false;
  bool isPlaying = false; // New variable to track if audio is playing
  String? filePath;
  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();
  final TextEditingController tag = TextEditingController();
  File? image;
  final ImagePicker picker = ImagePicker();
  final AudioRecorder recorder = AudioRecorder();
  final AudioPlayer player = AudioPlayer();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  Future<void> record() async {
    try {
      filePath = await getFilePath();
      await recorder.start(const RecordConfig(), path: filePath!);
      print('recording');
      setState(() {
        isRecording = true;
      });
    } catch (e) {
      debugPrint("Error starting recording: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      await recorder.stop();
      setState(() {
        if (isRecording == true) {
          isRecording = false;
        }
      });
      print(filePath);
    } catch (e) {
      debugPrint("Error stopping recording: $e");
    }
  }

  Future<void> play() async {
    try {
      if (filePath != null && !isRecording) {
        if (!isPlaying) {
          await player.play(UrlSource(filePath!));
          setState(() {
            isPlaying = true;
          });
          player.onPlayerComplete.listen((event) {
            setState(() {
              isPlaying = false;
            });
          });
        } else {
          await player.stop(); // Stop the audio playback
          setState(() {
            isPlaying = false;
          });
        }
      }
    } catch (e) {
      debugPrint("Error playing/stopping audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final fc = Provider.of<DB>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Flashcard',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: const Icon(Icons.check, size: 32),
              splashRadius: 104,
              onPressed: () {
                fc.addFlashcard(FlashcardCompanion(
                  question: drift.Value(question.text),
                  answer: drift.Value(answer.text),
                  tag: drift.Value(tag.text),
                  image: drift.Value(image?.path),
                  audio: drift.Value(filePath),
                ));
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Center(
                  child: SizedBox(
                    width: 256,
                    height: 256,
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.cover)
                        : const Icon(Icons.image_outlined, size: 150),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: question,
                decoration: const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Question',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: answer,
                decoration: const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Answer',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: tag,
                decoration: const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Tag',
                ),
              ),
              const SizedBox(height: 32),
              if (isRecording)
                const Text(
                  'Recording',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                 onPressed: (){
                  if(isRecording == true){
                    stopRecording();
                  }else{
                    record();
                  }
                 } ,//isRecording ? stopRecording : record,
                child: isRecording ? const Text('Stop Recording') : const Text('Record'),
              ),
              if (!isRecording && filePath != null)
                ElevatedButton(
                  onPressed: play,
                  child: isPlaying ? const Text('Stop Audio') : const Text('Play Audio'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

