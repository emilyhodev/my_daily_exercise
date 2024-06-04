import 'package:go_router/go_router.dart';
import 'package:my_daily_exercise/screens/home/home_screen2.dart';

import '../screens/base_screen.dart';
import '../screens/timer_screen.dart';

// final rootKey = GlobalKey();
// final shellKey = GlobalKey();

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => BaseScreen(child: child),
      routes: [
        GoRoute(
          path: AppRoute.home.path,
          builder: (context, state) => const HomeScreen2(),
        ),
        GoRoute(
          path: AppRoute.timer.path,
          builder: (context, state) => const TimerScreen(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.fullScreenTimer.path,
      builder: (context, state) => const TimerScreen(),
    ),
  ],
);

enum AppRoute {
  home('/'),
  timer('/timer'),
  fullScreenTimer('/fullscreentimer');

  const AppRoute(this.path);

  final String path;
}
