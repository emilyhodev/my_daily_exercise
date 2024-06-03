extension DoubleExtension on double {
  String toTimeString() {
    final minutes = toString().split('.').first.padLeft(2, '0');
    final seconds = ((this % 1) * 60).toInt().toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
