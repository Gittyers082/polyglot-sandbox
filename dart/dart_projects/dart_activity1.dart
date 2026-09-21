class DartIsBadass {
  final int number;

  DartIsBadass(this.number) : assert(number > 0, 'bobo');

  int getSum() {
    int sum = 0;
    int temp = number;

    while (temp > 0) {
      sum += temp % 10;
      temp ~/= 10;
    }
    return sum;
  }

  int getReverse() {
    int sum = getSum();
    int reverse = 0;

    while (sum != 0) {
      int remainder = sum % 10;
      reverse = reverse * 10 + remainder;
      sum ~/= 10;
    }
    return reverse;
  }

  bool isPrime() {
    int reverse = getReverse();

    if (reverse <= 1) {
      return false;
    }

    for (int i = 2; i <= reverse ~/ 2; i++) {
      if (reverse % i == 0) {
        return false;
      }
    }
    return true;
  }

  String checkParity() {
    int reverse = getReverse();

    if (reverse % 2 == 0) {
      return "even";
    } else {
      return "odd";
    }
  }

  int countDigits() {
    int temp = number;
    int count = 0;

    while (temp > 0) {
      int remainder = temp % 10;

      if (remainder > 5) {
        count++;
      }
      temp ~/= 10;
    }
    return count;
  }
}

void main() {
  var input = DartIsBadass(38402);

  print("Original number: ${input.number}");
  print("Sum of all digits: ${input.getSum()}");
  print("Reversed sum of all digits: ${input.getReverse()}");
  print("Prime status of the reversed sum: ${input.isPrime()}");
  print("Parity status of the reversed sum: ${input.checkParity()}");
  print("Total count of digits greater than 5: ${input.countDigits()}");
}
