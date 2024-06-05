import 'dart:math';

double randomDouble(double min, double max) {
  return min + (max - min) * Random().nextDouble();
}

int randomInt(int min, int max) {
  return min + Random().nextInt(max - min);
}
