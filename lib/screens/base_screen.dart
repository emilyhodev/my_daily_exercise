import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Daily Exercise'),
        toolbarHeight: 50,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
      //   ],
      //   currentIndex: 0,
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  
                  leading: Icon(Icons.home),
                  title: Text('HOME'),
                  // subtitle: Text('subtitle'),
                  // trailing: Icon(Icons.home),
                  onTap: () {
                    context.go('/');
                    Scaffold.of(context).closeDrawer();
                  },
                ),
              );
            }),
            // Timer Drawer item
            // Builder(
            //   builder: (context) => Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ListTile(
            //       leading: Icon(Icons.access_alarm_rounded),
            //       title: Text('TIMER'),
            //       // subtitle: Text('subtitle'),
            //       // trailing: Icon(Icons.access_alarm_rounded),
            //       onTap: () {
            //         context.go('/timer');
            //         Scaffold.of(context).closeDrawer();
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
        
      ),
      body: child,
    );
  }
}
