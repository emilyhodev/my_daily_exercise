import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/models/exercise.dart';
import 'package:my_daily_exercise/screens/home/home_controller.dart';

class ExerciseTimerDialog extends StatefulWidget {
  const ExerciseTimerDialog({
    super.key,
    this.exercise,
  });

  final Exercise? exercise;

  @override
  State<ExerciseTimerDialog> createState() => _ExerciseTimerDialogState();
}

class _ExerciseTimerDialogState extends State<ExerciseTimerDialog> {
  final _titleController = TextEditingController();
  final _workController = TextEditingController();
  final _restController = TextEditingController();
  final _cyclesController = TextEditingController();
  final _setsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.exercise?.title ?? '';
    _workController.text = widget.exercise?.workTime.toInt().toString() ?? '10';
    _restController.text = widget.exercise?.restTime.toInt().toString() ?? '10';
    _cyclesController.text = widget.exercise?.cycles.toString() ?? '10';
    _setsController.text = widget.exercise?.sets.toString() ?? '2';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _workController.dispose();
    _restController.dispose();
    _cyclesController.dispose();
    _setsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Timer Setting',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            buildRow('Work Time', _workController),
            buildRow('Rest Time', _restController),
            buildRow('Cycles', _cyclesController),
            buildRow('Sets', _setsController),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    onPressed: () => _onSave(ref).then((_) => context.pop()),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Exercise> _onSave(WidgetRef ref) async {
    final title = _titleController.text;
    final workTime = double.tryParse(_workController.text) ?? 0;
    final restTime = double.tryParse(_restController.text) ?? 0;
    final cycles = int.tryParse(_cyclesController.text) ?? 0;
    final sets = int.tryParse(_setsController.text) ?? 0;

    return await ref.read(homeControllerProvider.notifier).upsertExercise(
          id: widget.exercise?.id,
          title: title,
          workTime: workTime,
          restTime: restTime,
          cycles: cycles,
          sets: sets,
        );
  }

  Widget buildRow(String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => setState(() {
            var value = int.tryParse(controller.text) ?? 0;
            if (value > 0) {
              value--;
              controller.text = value.toString();
            }
          }),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(() {
            var value = int.tryParse(controller.text) ?? 0;
            value++;
            controller.text = value.toString();
          }),
        ),
      ],
    );
  }
}
