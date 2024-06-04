import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/home/home_state.dart';
import 'package:my_daily_exercise/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    // todo: final exercises = db.get();

    return const HomeState(
      exercises: [
        Exercise(
          id: '0',
          title: 'Leg Bridge Exercise',
        ),
        Exercise(
          id: '1',
          title: 'Leg Bridge Exercise',
        ),
      ],
    );
  }

  void toggleProgress(String exerciseId, WeekDay day) {
    // 1. find the index of the exercise
    final exercises = [...state.exercises];
    final index = exercises.indexWhere((e) => e.id == exerciseId);
    if (index == -1) return;

    // 2. update the progress and create a new exercise copy
    final exercise = exercises[index];
    final progress = {...exercise.progress};
    progress.contains(day) ? progress.remove(day) : progress.add(day);
    final updatedExercise = exercise.copyWith(progress: progress);

    // 3. replace the exercise in the list with the updated one
    exercises[index] = updatedExercise;

    // 4. update the state
    state = state.copyWith(exercises: exercises);
  }

  void createExercise(
      String title,
      String description,
      double workTime,
      double restTime,
      int cycles,
      int sets,
      Set<WeekDay> progress,
      String? image) {

    final exercise = Exercise(
      id: state.exercises.length.toString(),
      title: title,
      cycles: cycles,
      description: description,
      image: image,
      progress: progress,
      restTime: restTime,
      sets: sets,
      workTime: workTime,
    );

    final newExercises = [...state.exercises, exercise];
    state = state.copyWith(exercises: newExercises);
  }

  void deleteExercise(String exerciseId) {
    // 1. find the index of the exercise
    final exercises = [...state.exercises];
    final index = exercises.indexWhere((e) => e.id == exerciseId);
    if (index == -1) return;
    //remove exercise
    exercises.removeAt(index);
    state = state.copyWith(exercises: exercises);
  }
}
