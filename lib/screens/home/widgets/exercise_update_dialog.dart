import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/utils/constants.dart';

/// A dialog that allows the user to update exercise progress for each day of the week.
class ExerciseUpdateDialog extends StatelessWidget {
  const ExerciseUpdateDialog({
    super.key,
    required this.progress,
    required this.onDayToggle,
  });

  /// The set of days for which progress is tracked.
  final Set<WeekDay> progress;

  /// A callback function that is called when a day is toggled.
  final void Function(WeekDay day) onDayToggle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final day in WeekDay.values)
            CheckboxListTile(
              value: progress.contains(day),
              onChanged: (value) => onDayToggle(day),
              title: Text(day.label),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Done'),
        ),
      ],
    );
  }
}
