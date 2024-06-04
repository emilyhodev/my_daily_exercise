import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/exercise.dart';

part 'exercise_realm.g.dart';

@Riverpod(keepAlive: true)
ExerciseRealm exerciseRealm(ExerciseRealmRef ref) {
  // * Here throws an [UnimplementedError],
  // * but it will be overriden and initialized on app startup, see [main.dart].
  throw UnimplementedError();
}

class ExerciseRealm {
  final Realm _realm;

  ExerciseRealm({
    required Realm realm,
  }) : _realm = realm;

  Stream<RealmResultsChanges<Exercise>> changes() {
    return _realm.all<Exercise>().changes;
  }

  Exercise? find(ObjectId? id) {
    return _realm.find<Exercise>(id);
  }

  Future<Exercise> insert(Exercise exercise) {
    return _realm.writeAsync(() {
      return _realm.add(exercise);
    });
  }

  Future<Exercise> upsert(Exercise exercise) {
    return _realm.writeAsync(() {
      return _realm.add(exercise, update: true);
    });
  }

  Future<T> update<T>(T Function() writeCB) {
    return _realm.writeAsync(
      () => writeCB(),
    );
  }
}
