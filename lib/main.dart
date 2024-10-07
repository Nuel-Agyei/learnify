import 'package:flutter/material.dart';
import 'package:learnify/db/entity/remote/db.dart';
import 'package:learnify/pages/add_flashcard.dart';
import 'package:learnify/record.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    Provider<DB>(create: (_) => DB()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Record(),
    );
  }
}

