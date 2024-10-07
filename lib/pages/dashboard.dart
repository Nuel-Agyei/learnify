import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../db/entity/remote/db.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final fc = Provider.of<DB>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learnify',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 32, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(content: Text('Add FlashCard')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Filters(filter: 'All', color: Color.fromARGB(255, 163, 145, 147)),
              Filters(filter: 'Audio Only', color: Color.fromARGB(255, 246, 224, 181)),
              Filters(filter: 'Video Only', color: Color.fromARGB(255, 238, 169, 144)),
              Filters(filter: 'Text Only', color: Color.fromARGB(219, 170, 111, 115)),
            ],
          ),
          FutureBuilder(
            future: fc.getAll(), // Fetch the data asynchronously
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Handle any errors
                return const Center(child: Text('Error loading flashcards'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // Handle empty data
                return const Center(child: Text('No flashcards available'));
              }

              // If data is successfully fetched
              final flashcards = snapshot.data!;

              return FlutterCarousel(
                options: FlutterCarouselOptions(
                  height: MediaQuery.of(context).size.height * .55,
                  aspectRatio: 2.0,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                ),
                items: flashcards.map<Widget>((flashcard) {
                  return SizedBox(
                    width: 375,
                    height: MediaQuery.of(context).size.height * .55,
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.fromLTRB(12, 56, 12, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0), // You can adjust the radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              flashcard.question, // Display flashcard question
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                             Center(
                              widthFactor: 2,
                              child: Image(image: FileImage(flashcard.image == null ? File('') : File(flashcard.image!)), width: 200, height: 200),
                            ),
                            Text(
                              flashcard.answer, // Display flashcard answer
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({super.key, required this.filter, required this.color});
  final String filter;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          filter,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
