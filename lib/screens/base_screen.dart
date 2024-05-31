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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Builder(builder: (context) {
              return ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                subtitle: Text('subtitle'),
                trailing: Icon(Icons.home),
                onTap: () {
                  context.go('/');
                  Scaffold.of(context).closeDrawer();
                },
              );
            }),
            Builder(
              builder: (context) => ListTile(
                leading: Icon(Icons.access_alarm_rounded),
                title: Text('TIMER'),
                subtitle: Text('subtitle'),
                trailing: Icon(Icons.access_alarm_rounded),
                onTap: () {
                  context.go('/timer');
                  Scaffold.of(context).closeDrawer();
                },
              ),
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
