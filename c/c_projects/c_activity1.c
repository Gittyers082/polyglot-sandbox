#include <stdio.h>

// Declarations:
int getSumDigits(int number);

int getSumDigits(int number) {
    int sum = 0;

    while (number > 0) {
        sum += number % 10;
        number /= 10;
    }
    return sum;
}

int main() {
    int input;
    int sumDigit;
     printf("Enter a positive Integer: ");
     scanf("%d", &input);

     sumDigit = getSumDigits(input);

     printf("Original number: %d\n", input);
     printf("Sum of digits: %d\n", sumDigit);

     return 0;

}