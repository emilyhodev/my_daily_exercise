import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_daily_exercise/services/local_db/exercise_realm.dart';
import 'package:my_daily_exercise/utils/app_router.dart';
import 'package:realm/realm.dart';

import 'models/exercise.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final config = Configuration.local(
    [Exercise.schema],
    schemaVersion: 1,
  );

  final realm = Realm(config);

  runApp(
    ProviderScope(
      overrides: [
        exerciseRealmProvider.overrideWithValue(ExerciseRealm(realm: realm)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
