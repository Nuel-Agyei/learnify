import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package';

class AddFlashcard extends StatefulWidget {
  const AddFlashcard({super.key});

  @override
  State<AddFlashcard> createState() => _AddFlashcardState();
}

class _AddFlashcardState extends State<AddFlashcard> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add Flashcard', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding:const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(icon:const Icon(Icons.check, size: 32,),
            splashRadius:104,
            onPressed: (){
              print('saved');
            },
            ),
            
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: pickImage,
              child: image != null ? Image.file(image!, 
              fit: BoxFit.cover,) : const Icon(Icons.image_outlined, size: 128,),
            ),
          ],
        ),
      ),
    );
  }
}