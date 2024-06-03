import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/components/card_menu.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.image,
                    size: 40,
                  ),
                ),

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Leg Bridge Exercise"),
                    ),
                    Text(
                      "Total: 10:00",
                      style: textTheme.bodySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Progress ",
                            style: textTheme.labelSmall,
                          ),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          const Icon(Icons.square_rounded,
                              color: Colors.redAccent, size: 10),
                        ],
                      ),
                    )
                  ],
                ),
                const Align(alignment: Alignment.topRight, child: CardMenu()),
                // PLAY BUTTON
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors
                    .greenAccent, // Set your desired background color here
                borderRadius: BorderRadius.circular(
                    8.0), // Optional: Set border radius for rounded corners
              ),
              child: TextButton(
                child: const Text("Start Now"),
                onPressed: () {
                  context.push('/fullscreentimer');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
