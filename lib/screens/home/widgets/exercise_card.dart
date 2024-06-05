import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/home/widgets/exercise_timer_dialog.dart';
import 'package:my_daily_exercise/screens/home/widgets/exercise_update_dialog.dart';
import 'package:my_daily_exercise/utils/app_router.dart';
import 'package:my_daily_exercise/utils/convenient_extensions.dart';

import '../home_controller.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Image picker button
                IconButton(
                  onPressed: () {
                    // TODO: Implement image picker
                  },
                  icon: const Icon(Icons.image, size: 40),
                ),

                /// Title and progress
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(exercise.title),
                    ),
                    Text(
                      "Total: ${exercise.workTime.toTimeString()}",
                      style: textTheme.bodySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Progress ",
                            style: textTheme.labelSmall,
                          ),
                          for (final date in DateTime.now().currentWeek())
                            Icon(
                              Icons.square_rounded,
                              color: exercise.completedDates.contains(date)
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              size: 10,
                            ),
                        ],
                      ),
                    )
                  ],
                ),

                /// Popup menu
                Consumer(
                  builder: (context, ref, child) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: ExerciseCardPopupButton(
                        onEdit: () => _showEditDialog(context),
                        onManualUpdate: () => _showUpdateDialog(context),
                        onDelete: () => ref
                            .read(homeControllerProvider.notifier)
                            .deleteExercise(exercise),
                      ),
                    );
                  },
                ),
              ],
            ),

            /// Start button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text("Start Now"),
                onPressed: () => context.push(
                  AppRoute.fullScreenTimer.path,
                  extra: exercise,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ExerciseTimerDialog(
        exercise: exercise,
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Consumer(
        builder: (_, ref, __) {
          // Get the progress of the exercise
          final completedDates = ref.watch(
            homeControllerProvider.select((state) {
              final e = state.exercises.firstWhere(
                (e) => e.id == exercise.id,
                orElse: () => exercise,
              );
              return e.completedDates;
            }),
          );

          return ExerciseUpdateDialog(
            completedDates: completedDates,
            onDayToggle: (date) => ref
                .read(homeControllerProvider.notifier)
                .toggleCompletionDate(exercise.id, date),
          );
        },
      ),
    );
  }
}

enum _CardMenuAction {
  edit('Edit'),
  manualUpdate('Manual Update'),
  delete('Delete'),
  ;

  const _CardMenuAction(this.label);
  final String label;
}

class ExerciseCardPopupButton extends StatelessWidget {
  const ExerciseCardPopupButton({
    super.key,
    this.onEdit,
    this.onManualUpdate,
    this.onDelete,
  });

  final void Function()? onEdit;
  final void Function()? onManualUpdate;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (action) {
        switch (action) {
          case _CardMenuAction.edit:
            onEdit?.call();
          case _CardMenuAction.manualUpdate:
            onManualUpdate?.call();
          case _CardMenuAction.delete:
            onDelete?.call();
        }
      },
      itemBuilder: (context) => [
        for (final option in _CardMenuAction.values)
          PopupMenuItem(
            value: option,
            child: Text(option.label),
          ),
      ],
      icon: const Icon(Icons.more_vert),
    );
  }
}
