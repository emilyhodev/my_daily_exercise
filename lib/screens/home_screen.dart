import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_exercise/components/card_widget.dart';
import 'package:my_daily_exercise/components/timer_settings_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _handleImageSelected(File? image) {
    // Handle the selected image here
    // Do something with the selected image file
    if (image != null) {
      // Process the selected image
      // e.g., upload to server, save locally, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: CardWidget(),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: CardWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const TimerSettingsDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
