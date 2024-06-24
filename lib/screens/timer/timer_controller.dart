import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/timer/timer_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_controller.g.dart';

@Riverpod(dependencies: [])
Exercise pickedExercise(PickedExerciseRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [pickedExercise])
class TimerController extends _$TimerController {
  @override
  TimerState build() {
    final exercise = ref.watch(pickedExerciseProvider);
    var totalRemainingTime = (exercise.workTime + exercise.restTime) *
        exercise.sets *
        exercise.cycles;
    var remainSets = 0;
    var currentStatus = "Work";
    var currentColor = Colors.red;

    var stageTimer = exercise.workTime;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      totalRemainingTime--;
      stageTimer--;

      if (stageTimer == 0) {
        if (currentStatus == 'Work') {
          stageTimer = exercise.restTime;
          currentColor = Colors.green;
          currentStatus = "Rest";
        } else {
          stageTimer = exercise.workTime;
          currentColor = Colors.red;
          currentStatus = "Work";
        }
      }

      if (totalRemainingTime %
              ((exercise.workTime + exercise.restTime) * exercise.cycles) ==
          0) {
        remainSets++;
      }

      state = state.copyWith(
        totalTime: totalRemainingTime.toInt(),
        displayLargeTime: stageTimer.toInt().toString(),
        displayRemainingTime: formatTime(totalRemainingTime.toInt()),
        currentSet: remainSets.toString(),
        currentStatus: currentStatus.toString(),
        currentColor: currentColor,
      );
      if (totalRemainingTime == 0) {
        state = state.copyWith(
          totalTime: totalRemainingTime.toInt(),
          displayLargeTime: "Finished",
          displayRemainingTime: formatTime(totalRemainingTime.toInt()),
          currentSet: remainSets.toString(),
          currentStatus: "",
          currentColor: Colors.lightGreen,
        );
        timer.cancel();
      }
    });
    return TimerState(
      totalTime: exercise.workTime.toInt(),
      displayLargeTime: exercise.workTime.toInt().toString(),
      displayRemainingTime: formatTime(totalRemainingTime.toInt()),
      currentSet: "0",
      currentStatus: "Work",
      currentColor: Colors.red,
    );
  }

  String formatTime(int seconds) {
    // Format the time as desired (e.g., MM:SS)
    // Implement your own logic here
    // Example format: "01:30"
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
}
