import 'dart:math';

class SingletonHelper {
  static final SingletonHelper _singleton = SingletonHelper._internal();
  Random _random = new Random();

  factory SingletonHelper() {
    return _singleton;
  }
  SingletonHelper._internal();
  int next(int min, int max) => min + _random.nextInt(max - min);
}

abstract class helper {
  static double nextDouble(double min, double max) {
    Random _random = new Random();
    double ans = min + _random.nextDouble() * (max - min);

    return ans;
  }
  static int next(int min, int max) {

    Random _random = new Random();

    return min + _random.nextInt(max - min);
  }
}
