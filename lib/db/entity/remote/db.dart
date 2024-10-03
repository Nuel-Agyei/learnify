import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import '../flashcard.dart';
part 'db.g.dart';

// Function to lazily open the connection to the SQLite database
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'flashcard.db'));
    return NativeDatabase(file);
  });
}

// DriftDatabase is now extended
@DriftDatabase(tables: [Flashcard])
class DB extends _$DB{
  // Singleton implementation to avoid multiple instances of the database
  static final DB _instance = DB._internal();
  
  DB._internal() : super(openConnection());
  
  factory DB() {
    return _instance;
  }

  @override
  int get schemaVersion => 1;

  Future<List<FlashcardData>> getAll()async => await select(flashcard).get();

  Future<int> addFlashcard(FlashcardCompanion fc)async {
    return await into(flashcard).insert(fc);
  }

  Future<bool> updateFlashcard(FlashcardCompanion fc)async {
    return await update(flashcard).replace(fc);
  }
  Future<int> deleteFlashcard(FlashcardCompanion fc)async {
    return await delete(flashcard).delete(fc);
  }
}