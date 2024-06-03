import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_daily_exercise/utils/constants.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String title,
    @Default('') String description,
    @Default(10.0) double workTime,
    @Default(5.0) double restTime,
    @Default(10) int cycles,
    @Default(2) int sets,
    @Default(<WeekDay>{}) Set<WeekDay> progress,
    String? image,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
