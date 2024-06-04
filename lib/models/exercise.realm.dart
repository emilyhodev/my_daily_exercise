// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Exercise extends _Exercise
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Exercise(
    ObjectId id,
    String title, {
    double workTime = 10.0,
    double restTime = 10.0,
    int cycles = 10,
    int sets = 2,
    Set<DateTime> completedDates = const {},
    String? description,
    String? image,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Exercise>({
        'workTime': 10.0,
        'restTime': 10.0,
        'cycles': 10,
        'sets': 2,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'workTime', workTime);
    RealmObjectBase.set(this, 'restTime', restTime);
    RealmObjectBase.set(this, 'cycles', cycles);
    RealmObjectBase.set(this, 'sets', sets);
    RealmObjectBase.set<RealmSet<DateTime>>(
        this, 'completedDates', RealmSet<DateTime>(completedDates));
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'image', image);
  }

  Exercise._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  double get workTime =>
      RealmObjectBase.get<double>(this, 'workTime') as double;
  @override
  set workTime(double value) => RealmObjectBase.set(this, 'workTime', value);

  @override
  double get restTime =>
      RealmObjectBase.get<double>(this, 'restTime') as double;
  @override
  set restTime(double value) => RealmObjectBase.set(this, 'restTime', value);

  @override
  int get cycles => RealmObjectBase.get<int>(this, 'cycles') as int;
  @override
  set cycles(int value) => RealmObjectBase.set(this, 'cycles', value);

  @override
  int get sets => RealmObjectBase.get<int>(this, 'sets') as int;
  @override
  set sets(int value) => RealmObjectBase.set(this, 'sets', value);

  @override
  RealmSet<DateTime> get completedDates =>
      RealmObjectBase.get<DateTime>(this, 'completedDates')
          as RealmSet<DateTime>;
  @override
  set completedDates(covariant RealmSet<DateTime> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<Exercise>> get changes =>
      RealmObjectBase.getChanges<Exercise>(this);

  @override
  Stream<RealmObjectChanges<Exercise>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Exercise>(this, keyPaths);

  @override
  Exercise freeze() => RealmObjectBase.freezeObject<Exercise>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'workTime': workTime.toEJson(),
      'restTime': restTime.toEJson(),
      'cycles': cycles.toEJson(),
      'sets': sets.toEJson(),
      'completedDates': completedDates.toEJson(),
      'description': description.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(Exercise value) => value.toEJson();
  static Exercise _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'workTime': EJsonValue workTime,
        'restTime': EJsonValue restTime,
        'cycles': EJsonValue cycles,
        'sets': EJsonValue sets,
        'completedDates': EJsonValue completedDates,
        'description': EJsonValue description,
        'image': EJsonValue image,
      } =>
        Exercise(
          fromEJson(id),
          fromEJson(title),
          workTime: fromEJson(workTime),
          restTime: fromEJson(restTime),
          cycles: fromEJson(cycles),
          sets: fromEJson(sets),
          completedDates: fromEJson(completedDates),
          description: fromEJson(description),
          image: fromEJson(image),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Exercise._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Exercise, 'Exercise', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('workTime', RealmPropertyType.double),
      SchemaProperty('restTime', RealmPropertyType.double),
      SchemaProperty('cycles', RealmPropertyType.int),
      SchemaProperty('sets', RealmPropertyType.int),
      SchemaProperty('completedDates', RealmPropertyType.timestamp,
          collectionType: RealmCollectionType.set),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
