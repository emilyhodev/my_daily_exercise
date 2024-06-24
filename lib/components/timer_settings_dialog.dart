import 'package:flutter/material.dart';

class TimerSettingsDialog extends StatefulWidget {
  const TimerSettingsDialog({super.key});

  @override
  State<TimerSettingsDialog> createState() => _TimerSettingsDialogState();
}

class _TimerSettingsDialogState extends State<TimerSettingsDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController restController = TextEditingController();
  TextEditingController cyclesController = TextEditingController();
  TextEditingController setsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    workController.text = '10';
    restController.text = '10';
    cyclesController.text = '10';
    setsController.text = '2';
  }

  @override
  void dispose() {
    titleController.dispose();
    workController.dispose();
    restController.dispose();
    cyclesController.dispose();
    setsController.dispose();
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
              'Add/Edit Timer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 100),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            buildRow('Work Time', workController, defaultValue: '10'),
            buildRow('Rest Time', restController, defaultValue: '10'),
            buildRow('Cycles', cyclesController, defaultValue: '10'),
            buildRow('Sets', setsController, defaultValue: '2'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Perform action on "Save" button press
                    // Retrieve the entered values
                    String title = titleController.text;
                    int workTime = int.tryParse(workController.text) ?? 0;
                    int restTime = int.tryParse(restController.text) ?? 0;
                    int cycles = int.tryParse(cyclesController.text) ?? 0;
                    int sets = int.tryParse(setsController.text) ?? 0;

                    // Print the values (you can modify this code to perform other actions)
                    print('Title: $title');
                    print('Work Time: $workTime');
                    print('Rest Time: $restTime');
                    print('Cycles: $cycles');
                    print('Sets: $sets');

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, TextEditingController controller,
      {String defaultValue = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              int value = int.tryParse(controller.text) ?? 0;
              if (value > 0) {
                value--;
                controller.text = value.toString();
              }
            });
          },
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
          onPressed: () {
            setState(() {
              int value = int.tryParse(controller.text) ?? 0;
              value++;
              controller.text = value.toString();
            });
          },
        ),
      ],
    );
  }
}
