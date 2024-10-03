// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $FlashcardTable extends Flashcard
    with TableInfo<$FlashcardTable, FlashcardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deckMeta = const VerificationMeta('deck');
  @override
  late final GeneratedColumn<String> deck = GeneratedColumn<String>(
      'deck', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioMeta = const VerificationMeta('audio');
  @override
  late final GeneratedColumn<String> audio = GeneratedColumn<String>(
      'audio', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, deck, question, answer, image, audio, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcard';
  @override
  VerificationContext validateIntegrity(Insertable<FlashcardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deck')) {
      context.handle(
          _deckMeta, deck.isAcceptableOrUnknown(data['deck']!, _deckMeta));
    } else if (isInserting) {
      context.missing(_deckMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('audio')) {
      context.handle(
          _audioMeta, audio.isAcceptableOrUnknown(data['audio']!, _audioMeta));
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deck: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deck'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      audio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio']),
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $FlashcardTable createAlias(String alias) {
    return $FlashcardTable(attachedDatabase, alias);
  }
}

class FlashcardData extends DataClass implements Insertable<FlashcardData> {
  final int id;
  final String deck;
  final String question;
  final String answer;
  final String? image;
  final String? audio;
  final String tag;
  const FlashcardData(
      {required this.id,
      required this.deck,
      required this.question,
      required this.answer,
      this.image,
      this.audio,
      required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deck'] = Variable<String>(deck);
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || audio != null) {
      map['audio'] = Variable<String>(audio);
    }
    map['tag'] = Variable<String>(tag);
    return map;
  }

  FlashcardCompanion toCompanion(bool nullToAbsent) {
    return FlashcardCompanion(
      id: Value(id),
      deck: Value(deck),
      question: Value(question),
      answer: Value(answer),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      audio:
          audio == null && nullToAbsent ? const Value.absent() : Value(audio),
      tag: Value(tag),
    );
  }

  factory FlashcardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlashcardData(
      id: serializer.fromJson<int>(json['id']),
      deck: serializer.fromJson<String>(json['deck']),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      image: serializer.fromJson<String?>(json['image']),
      audio: serializer.fromJson<String?>(json['audio']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deck': serializer.toJson<String>(deck),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'image': serializer.toJson<String?>(image),
      'audio': serializer.toJson<String?>(audio),
      'tag': serializer.toJson<String>(tag),
    };
  }

  FlashcardData copyWith(
          {int? id,
          String? deck,
          String? question,
          String? answer,
          Value<String?> image = const Value.absent(),
          Value<String?> audio = const Value.absent(),
          String? tag}) =>
      FlashcardData(
        id: id ?? this.id,
        deck: deck ?? this.deck,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        image: image.present ? image.value : this.image,
        audio: audio.present ? audio.value : this.audio,
        tag: tag ?? this.tag,
      );
  FlashcardData copyWithCompanion(FlashcardCompanion data) {
    return FlashcardData(
      id: data.id.present ? data.id.value : this.id,
      deck: data.deck.present ? data.deck.value : this.deck,
      question: data.question.present ? data.question.value : this.question,
      answer: data.answer.present ? data.answer.value : this.answer,
      image: data.image.present ? data.image.value : this.image,
      audio: data.audio.present ? data.audio.value : this.audio,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardData(')
          ..write('id: $id, ')
          ..write('deck: $deck, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('image: $image, ')
          ..write('audio: $audio, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, deck, question, answer, image, audio, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlashcardData &&
          other.id == this.id &&
          other.deck == this.deck &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.image == this.image &&
          other.audio == this.audio &&
          other.tag == this.tag);
}

class FlashcardCompanion extends UpdateCompanion<FlashcardData> {
  final Value<int> id;
  final Value<String> deck;
  final Value<String> question;
  final Value<String> answer;
  final Value<String?> image;
  final Value<String?> audio;
  final Value<String> tag;
  const FlashcardCompanion({
    this.id = const Value.absent(),
    this.deck = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.image = const Value.absent(),
    this.audio = const Value.absent(),
    this.tag = const Value.absent(),
  });
  FlashcardCompanion.insert({
    this.id = const Value.absent(),
    required String deck,
    required String question,
    required String answer,
    this.image = const Value.absent(),
    this.audio = const Value.absent(),
    required String tag,
  })  : deck = Value(deck),
        question = Value(question),
        answer = Value(answer),
        tag = Value(tag);
  static Insertable<FlashcardData> custom({
    Expression<int>? id,
    Expression<String>? deck,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<String>? image,
    Expression<String>? audio,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deck != null) 'deck': deck,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (image != null) 'image': image,
      if (audio != null) 'audio': audio,
      if (tag != null) 'tag': tag,
    });
  }

  FlashcardCompanion copyWith(
      {Value<int>? id,
      Value<String>? deck,
      Value<String>? question,
      Value<String>? answer,
      Value<String?>? image,
      Value<String?>? audio,
      Value<String>? tag}) {
    return FlashcardCompanion(
      id: id ?? this.id,
      deck: deck ?? this.deck,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      image: image ?? this.image,
      audio: audio ?? this.audio,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deck.present) {
      map['deck'] = Variable<String>(deck.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (audio.present) {
      map['audio'] = Variable<String>(audio.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardCompanion(')
          ..write('id: $id, ')
          ..write('deck: $deck, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('image: $image, ')
          ..write('audio: $audio, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  $DBManager get managers => $DBManager(this);
  late final $FlashcardTable flashcard = $FlashcardTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [flashcard];
}

typedef $$FlashcardTableCreateCompanionBuilder = FlashcardCompanion Function({
  Value<int> id,
  required String deck,
  required String question,
  required String answer,
  Value<String?> image,
  Value<String?> audio,
  required String tag,
});
typedef $$FlashcardTableUpdateCompanionBuilder = FlashcardCompanion Function({
  Value<int> id,
  Value<String> deck,
  Value<String> question,
  Value<String> answer,
  Value<String?> image,
  Value<String?> audio,
  Value<String> tag,
});

class $$FlashcardTableFilterComposer
    extends FilterComposer<_$DB, $FlashcardTable> {
  $$FlashcardTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get deck => $state.composableBuilder(
      column: $state.table.deck,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get question => $state.composableBuilder(
      column: $state.table.question,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get answer => $state.composableBuilder(
      column: $state.table.answer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get audio => $state.composableBuilder(
      column: $state.table.audio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tag => $state.composableBuilder(
      column: $state.table.tag,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FlashcardTableOrderingComposer
    extends OrderingComposer<_$DB, $FlashcardTable> {
  $$FlashcardTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get deck => $state.composableBuilder(
      column: $state.table.deck,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get question => $state.composableBuilder(
      column: $state.table.question,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get answer => $state.composableBuilder(
      column: $state.table.answer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get audio => $state.composableBuilder(
      column: $state.table.audio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tag => $state.composableBuilder(
      column: $state.table.tag,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FlashcardTableTableManager extends RootTableManager<
    _$DB,
    $FlashcardTable,
    FlashcardData,
    $$FlashcardTableFilterComposer,
    $$FlashcardTableOrderingComposer,
    $$FlashcardTableCreateCompanionBuilder,
    $$FlashcardTableUpdateCompanionBuilder,
    (FlashcardData, BaseReferences<_$DB, $FlashcardTable, FlashcardData>),
    FlashcardData,
    PrefetchHooks Function()> {
  $$FlashcardTableTableManager(_$DB db, $FlashcardTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FlashcardTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FlashcardTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> deck = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> audio = const Value.absent(),
            Value<String> tag = const Value.absent(),
          }) =>
              FlashcardCompanion(
            id: id,
            deck: deck,
            question: question,
            answer: answer,
            image: image,
            audio: audio,
            tag: tag,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String deck,
            required String question,
            required String answer,
            Value<String?> image = const Value.absent(),
            Value<String?> audio = const Value.absent(),
            required String tag,
          }) =>
              FlashcardCompanion.insert(
            id: id,
            deck: deck,
            question: question,
            answer: answer,
            image: image,
            audio: audio,
            tag: tag,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FlashcardTableProcessedTableManager = ProcessedTableManager<
    _$DB,
    $FlashcardTable,
    FlashcardData,
    $$FlashcardTableFilterComposer,
    $$FlashcardTableOrderingComposer,
    $$FlashcardTableCreateCompanionBuilder,
    $$FlashcardTableUpdateCompanionBuilder,
    (FlashcardData, BaseReferences<_$DB, $FlashcardTable, FlashcardData>),
    FlashcardData,
    PrefetchHooks Function()>;

class $DBManager {
  final _$DB _db;
  $DBManager(this._db);
  $$FlashcardTableTableManager get flashcard =>
      $$FlashcardTableTableManager(_db, _db.flashcard);
}
