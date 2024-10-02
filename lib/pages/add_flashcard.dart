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
  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();
  final TextEditingController tag = TextEditingController();
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: image != null ? Image.file(image!, fit: BoxFit.cover,) : const Icon(Icons.image_outlined, size: 150,),
                  ),
                ),
              ),
              const SizedBox(height: 32,),
              
              //Question
              TextField(
                controller: question,
                decoration:const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Question',
                ),
              ),

              //Answer
              TextField(
                controller: answer,
                decoration:const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Answer',
                ),
              ),
              const SizedBox(height: 32,),

              //Tag
              TextField(
                controller: tag,
                decoration:const InputDecoration(
                  focusColor: Colors.brown,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                  labelText: 'Tag',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}