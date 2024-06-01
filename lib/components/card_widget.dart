import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/components/card_menu.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.image,
                    size: 40,
                  ),
                ),
            
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          Text("Progress ", style: textTheme.labelSmall,),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.greenAccent, size: 10),
                          Icon(Icons.square_rounded,
                              color: Colors.redAccent, size: 10),
                        ],
                      ),
                    )
                  ],
                ),
                Align(alignment: Alignment.topRight, child: CardMenu()),
                          // PLAY BUTTON
                
              ],
            ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
    color: Colors.greenAccent, // Set your desired background color here
    borderRadius: BorderRadius.circular(8.0), // Optional: Set border radius for rounded corners
            ),
            child: TextButton(child: Text("Start Now") , 
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
