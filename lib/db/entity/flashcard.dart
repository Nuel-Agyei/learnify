import 'package:drift/drift.dart';

class Flashcard extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get deck => text().nullable()();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  TextColumn get image => text().nullable()();
  TextColumn get audio => text().nullable()();
  TextColumn get tag => text()();
}