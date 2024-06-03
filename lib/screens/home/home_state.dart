import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/exercise.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<Exercise> exercises,
  }) = _HomeState;
}
