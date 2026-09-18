#include <stdio.h>

int getSumDigits(int number);
int getReverseSum(int number);
bool isPrime(int number);

int getSumDigits(int number) {
    int sum = 0;

    while (number > 0) {
        sum += number % 10;
        number /= 10;
    }
    return sum;
}

int getReverseSum(int number) {
    int sumDigits = getSumDigits(number);
    int reverseSum = 0;

    while (number != 0) {
        int remainder = number % 10;
        reverseSum = reverseSum * 10 + remainder;
        number /= 10;
    }
    return reverseSum;
}

int

int main() {
    int input;
    int sumDigits;
     printf("Enter a positive Integer: ");
     scanf("%d", &input);

     sumDigits = getSumDigits(input);

     printf("Original number: %d\n", input);
     printf("Sum of digits: %d\n", sumDigits);

     return 0;

}