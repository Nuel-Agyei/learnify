import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnify/db/entity/remote/db.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart'; // Keep this import as per your request
import 'package:path_provider/path_provider.dart';

import '../db/entity/flashcard.dart';

class AddFlashcard extends StatefulWidget {
  const AddFlashcard({super.key});

  @override
  State<AddFlashcard> createState() => _AddFlashcardState();
}

class _AddFlashcardState extends State<AddFlashcard> {
  bool isRecording = false;
  String? filePath; // Updated to store the valid file path
  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();
  final TextEditingController tag = TextEditingController();
  File? image;
  final ImagePicker picker = ImagePicker();
  final AudioRecorder recorder = AudioRecorder(); // Keep AudioRecorder as is
  final AudioPlayer player = AudioPlayer();

  // Method to pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  // Method to get valid file path for saving the audio file
  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  // Start recording audio
  Future<void> record() async {
    try {
      filePath = await getFilePath(); // Ensure valid file path
      await recorder.start(const RecordConfig(), path: filePath!); // Pass valid path to start recording
      setState(() {
        isRecording = true;
      });
    } catch (e) {
      print("Error starting recording: $e");
    }
  }

  // Stop recording audio
  Future<void> stop() async {
    try {
      await recorder.stop(); // Stop recording
      setState(() {
        if(isRecording == true) {
          isRecording = false;
        }
        // isRecording = false;
        print('filePath: $filePath');
      });
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }

  // Play recorded audio
  Future<void> play() async {
    try {
      if (filePath != null && !isRecording) {
        await player.play(UrlSource(filePath!)); // Play the saved audio file
      }
    } catch (e) {
      print("Error playing audio: $e");
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
                ));
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
                    width: 150,
                    height: 150,
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.cover)
                        : const Icon(Icons.image_outlined, size: 150),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Question input field
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
              // Answer input field
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
              // Tag input field
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
              // Recording status
              if (isRecording)
                const Text(
                  'Recording',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 16),
              // Record/Stop button
              ElevatedButton(
                onPressed: isRecording ? stop : record,

                child: isRecording ? const Text('Stop') : const Text('Record'),
              ),
              // Play button (visible when recording stops and file exists)
              if (!isRecording && filePath != null)
                ElevatedButton(
                  onPressed: play,
                  child: const Icon(Icons.play_arrow_sharp),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
