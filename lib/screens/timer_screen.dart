import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/timer/timer_controller.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ProviderScope(
      overrides: [
        pickedExerciseProvider.overrideWithValue(exercise),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          final timerState = ref.watch(timerControllerProvider);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/');
                },
              ),
              title: const Text('Timer'),
              centerTitle: true,
            ),
            backgroundColor: timerState.currentColor,
            // backgroundColor: const Color.fromARGB(255, 220, 254, 237),
            body: Consumer(
              builder: (context, ref, child) {
                final timerState = ref.watch(timerControllerProvider);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(timerState.currentStatus,
                        style: textTheme.displayLarge),
                    LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        height: constraints.biggest.width,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            timerState.displayLargeTime,
                            // style: const TextStyle(fontSize: 300),
                          ),
                        ),
                      );
                    }),
                    Consumer(
                      builder: (context, ref, child) {
                        final timerState = ref.watch(timerControllerProvider);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Sets ${timerState.currentSet}/${exercise.sets}",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Remains: ${timerState.displayRemainingTime}",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
