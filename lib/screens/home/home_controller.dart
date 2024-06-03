import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/home/home_state.dart';
import 'package:my_daily_exercise/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    return const HomeState(
      exercises: [
        Exercise(
          id: '1',
          title: 'Leg Bridge Exercise',
        ),
        Exercise(
          id: '2',
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
}
