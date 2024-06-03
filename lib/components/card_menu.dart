import 'package:flutter/material.dart';
import 'package:my_daily_exercise/components/timer_settings_dialog.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Handle menu item selection here
        if (value == 'edit') {
          // Perform edit action
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const TimerSettingsDialog();
            },
          );
        } else if (value == 'manual_update') {
          // Perform manual update action
        } else if (value == 'delete') {
          // Perform delete action
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'manual_update',
          child: Text('Manual Update'),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
      icon: const Icon(Icons.more_vert),
    );
  }
}
