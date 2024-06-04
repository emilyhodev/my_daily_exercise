import 'package:realm/realm.dart';

part 'exercise.realm.dart';

/// DB Model for Exercise
@RealmModel()
class _Exercise {
  // Required fields
  @PrimaryKey()
  late ObjectId id;
  late String title;

  // Optional fields with default values
  late double workTime = 10.0;
  late double restTime = 10.0;
  late int cycles = 10;
  late int sets = 2;
  late Set<DateTime> completedDates; // Realm will init this as an empty set

  // Optional fields
  String? description;
  String? image;
}
