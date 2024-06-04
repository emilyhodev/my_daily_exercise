import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_exercise/screens/home/home_controller.dart';
import 'package:my_daily_exercise/screens/home/widgets/exercise_card.dart';
import 'package:my_daily_exercise/screens/home/widgets/exercise_timer_dialog.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final exercises = ref.watch(
            homeControllerProvider.select((state) => state.exercises),
          );

          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ExerciseCard(exercise: exercises[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const ExerciseTimerDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
