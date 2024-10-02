import 'package:drift/drift.dart';

class Flashcard extends Table {
  TextColumn get id => text()();
  TextColumn get deck => text()();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get image => text().nullable()();
  // TextColumn get audio => text().nullable()();
  TextColumn get tag => text()();
}