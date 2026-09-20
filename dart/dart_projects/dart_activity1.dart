class DartIsBadass {
  final int number;

  DartIsBadass(this.number) : assert(number > 0, 'bobo');

  int getSum() {
    int sum = 0;
    int temp = number;

    while (temp > 0) {
      sum += temp % 10;
      temp ~/ 10;
    }
    return sum;
  }

  int getReverse() {}
}
