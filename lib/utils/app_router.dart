import 'package:go_router/go_router.dart';

import '../screens/base_screen.dart';
import '../screens/home_screen.dart';
import '../screens/timer_screen.dart';

// final rootKey = GlobalKey();
// final shellKey = GlobalKey();

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => BaseScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/timer',
          builder: (context, state) => TimerScreen(),
        ),
      ],
    ),
    GoRoute(
          path: '/fullscreentimer',
          builder: (context, state) => TimerScreen(),
        ),
  ],
);
