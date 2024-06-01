import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: Text('Timer'),
        centerTitle: true,
      ),
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
