import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("TITLE", style: TextStyle(color: Colors.amber[900])),
                    Text("Leg Bridge Exercise"),
                    Text("Interval : 10s work, 10s rest"),
                  ],
                ),
                IconButton.filled(
                    onPressed: () {}, icon: Icon(Icons.play_arrow))
              ],
            ),
          )
        ],
      ),
    );
  }
}
