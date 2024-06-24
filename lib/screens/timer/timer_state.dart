import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    required int totalTime,
    required String displayLargeTime,
    required String displayRemainingTime,
    required String currentSet,
    required String currentStatus,
    required Color currentColor,
  }) = _TimerState;
}
