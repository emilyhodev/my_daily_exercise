import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 175, 255, 216),
      body: Column(
        children: [
          Text("Work", style: textTheme.displayLarge),
          // Text("10", style: TextStyle(fontSize: 250)),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1000,
            ),
            child: SizedBox(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text("10"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sets 5/10"),
              Text("Remaining Time: 10:00"),
            ],
          )
        ],
      ),
    );
  }
}
