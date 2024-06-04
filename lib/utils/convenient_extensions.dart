extension DoubleExtension on double {
  String toTimeString() {
    final minutes = toString().split('.').first.padLeft(2, '0');
    final seconds = ((this % 1) * 60).toInt().toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}

extension DateTimeExtension on DateTime {
  List<DateTime> currentWeek() {
    var now = DateTime.now().toUtc();
    now = DateTime(now.year, now.month, now.day, 0, 0, 0, 0);
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    final currentWeekDates = <DateTime>[];
    for (var i = 0; i < 7; i++) {
      currentWeekDates.add(startOfWeek.add(Duration(days: i)));
    }
    return currentWeekDates;
  }
}
