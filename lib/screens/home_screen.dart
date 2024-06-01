import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/components/card_widget.dart';
import 'package:my_daily_exercise/components/image_picker.dart';
import 'package:my_daily_exercise/components/timer_settings_dialog.dart';
import 'dart:io';
import 'package:flutter/material.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CardWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CardWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimerSettingsDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
