import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/models/exercise.dart';

import 'timer/widgets/hour_glass.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: Text(exercise.title),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 175, 255, 216),
      body: Column(
        children: [
          Text("Work", style: textTheme.displayLarge),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                width: constraints.maxWidth / 2,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Text("10"),
                ),
              ),
            ),
          ),
          const HourGlass(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sets 5/10", style: textTheme.labelLarge),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Remains: 10:00", style: textTheme.labelLarge),
              ),
            ],
          )
        ],
      ),
    );
  }
}
