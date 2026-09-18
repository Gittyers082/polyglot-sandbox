#include <stdio.h>
#include <stdbool.h>

int getSumDigits(int number);
int getReverseSum(int number);
bool isPrime(int number);
const char* checkParity(int number);
int countDigitsGreaterThanFive(int number);

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

    while (sumDigits != 0) {
        int remainder = sumDigits % 10;
        reverseSum = reverseSum * 10 + remainder;
        sumDigits /= 10;
    }
    return reverseSum;
}

bool isPrime(int number) {  
    if (number <= 1) {
        return false;
    }

    for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
            return false;
        }
    }
    return true;
}

const char* checkParity(int number) {
    if (number % 2 == 0) {
        return "even";
    } else {
        return "odd";
    } 
}

int countDigitsGreaterThanFive(int number) {
    int count = 0;

    while (number > 0) {
        int remainder =  number % 10;

        if (remainder > 5) {
            count++;
        }
        number /= 10;
    }
    return count;
}

int main() {
    int input;

    printf("Enter a positive integer: ");
    if (scanf("%d", &input) != 1 || input <= 0) {
        printf("Error: Input must be a positive integer! Your input: %d\n", input);
        return 1;
    } 

    int sumDigits = getSumDigits(input);
    int reverseSum = getReverseSum(input);
    bool primeStats = isPrime(reverseSum);
    const char* parityStats = checkParity(reverseSum);
    int count = countDigitsGreaterThanFive(input);

    printf("Original number: %d\n", input);
    printf("Sum of all digits: %d\n", sumDigits);
    printf("Reversed sum of all digits: %d\n", reverseSum);
    printf("Prime status of the reversed sum: %s\n", primeStats ? "Is Prime" : "Not Prime");
    printf("Parity status of the reversed sum: %s\n", parityStats);
    printf("Total count of digits greater than 5: %d\n", count);

    return 0;
}