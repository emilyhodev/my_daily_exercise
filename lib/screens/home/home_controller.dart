import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/home/home_state.dart';
import 'package:my_daily_exercise/services/local_db/exercise_realm.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late final ExerciseRealm _exerciseRealm;

  @override
  HomeState build() {
    _exerciseRealm = ref.watch(exerciseRealmProvider);
    final subscription = _exerciseRealm.changes().listen((changes) {
      final exercises = changes.results.toList();
      state = state.copyWith(exercises: exercises);
    });

    ref.onDispose(() => subscription.cancel());

  return const HomeState();
  }

  Future<bool> toggleCompletionDate(ObjectId exerciseId, DateTime date) async {
    date = date.toUtc();

    // 1. find the index of the exercise
    final exercises = [...state.exercises];
    final index = exercises.indexWhere((e) => e.id == exerciseId);
    if (index == -1) return false;

    // 2. update the DB
    final exercise = exercises[index];
    return _exerciseRealm.update(() {
      return exercise.completedDates.contains(date)
          ? exercise.completedDates.remove(date)
          : exercise.completedDates.add(date);
    });
  }

  Future<Exercise> upsertExercise({
    ObjectId? id,
    String? title,
    double? workTime,
    double? restTime,
    int? cycles,
    int? sets,
    String? description,
    String? image,
  }) {
    final record = ref.read(exerciseRealmProvider).find(id);
    if (record == null) {
      final exercise = Exercise(
        id ?? ObjectId(),
        title ?? 'New Exercise',
        workTime: workTime ?? 10.0,
        restTime: restTime ?? 10.0,
        cycles: cycles ?? 10,
        sets: sets ?? 2,
        description: description,
        image: image,
      );
      return ref.read(exerciseRealmProvider).insert(exercise);
    }

    return ref.read(exerciseRealmProvider).update(
      () {
        record.title = title ?? record.title;
        record.workTime = workTime ?? record.workTime;
        record.restTime = restTime ?? record.restTime;
        record.cycles = cycles ?? record.cycles;
        record.sets = sets ?? record.sets;
        record.description = description;
        record.image = image;

        return record;
      },
    );
  }

  Future<void> deleteExercise(Exercise exercise) {
    // TODO(@emilyhodev): delete exercise from the DB
    return ref.read(exerciseRealmProvider).delete(exercise);
    // 1. find the index of the exercise
    // final exercises = [...state.exercises];
    // final index = exercises.indexWhere((e) => e.id == exerciseId);
    // if (index == -1) return;
    //remove exercise
    // exercises.removeAt(index);
    // state = state.copyWith(exercises: exercises);
  }
}
