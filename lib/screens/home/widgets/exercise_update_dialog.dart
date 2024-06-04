import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/utils/constants.dart';
import 'package:my_daily_exercise/utils/convenient_extensions.dart';

/// A dialog that allows the user to update exercise progress for each day of the week.
class ExerciseUpdateDialog extends StatelessWidget {
  const ExerciseUpdateDialog({
    super.key,
    required this.completedDates,
    required this.onDayToggle,
  });

  /// The set of days for which progress is tracked.
  final Set<DateTime> completedDates;

  /// A callback function that is called when a day is toggled.
  final void Function(DateTime dateTime) onDayToggle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final date in DateTime.now().currentWeek())
            CheckboxListTile(
              value: completedDates.contains(date),
              onChanged: (value) => onDayToggle(date),
              title: Text(WeekDay.values[date.weekday - 1].label),
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
