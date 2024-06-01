import 'package:flutter/material.dart';
import 'package:my_daily_exercise/components/card_widget.dart';
import 'package:my_daily_exercise/components/image_picker.dart';
import 'package:my_daily_exercise/components/timer_settings_dialog.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
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
              return TimerSettingsDialog();
            },
          );
        } else if (value == 'manual_update') {
          // Perform manual update action
        } else if (value == 'delete') {
          // Perform delete action
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        PopupMenuItem<String>(
          value: 'manual_update',
          child: Text('Manual Update'),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
      icon: Icon(Icons.more_vert),
    );
  }
}