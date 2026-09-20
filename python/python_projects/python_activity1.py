class PythonIsCool:
    def __init__(self, number):
        self.number = number

    def get_sum(self):
        sum = 0
        temp = self.number

        while temp > 0:
            sum += temp % 10
            temp //= 10

        return sum

    def get_reverse(self):
        sum = self.get_sum()
        reverse = 0

        while sum != 0:
            remainder = sum % 10
            reverse = reverse * 10 + remainder
            sum //= 10

        return reverse

    def is_prime(self):
        number = self.get_reverse()
        
        if number <= 1:
            return False

        for i in range(2, (number // 2) + 1):
            if number % i == 0:
                return False

        return True

    def check_parity(self):
        number = self.get_reverse()

        if number % 2 == 0:
            return "even"
        else:
            return "odd"

    def count_digits(self):
        number = self.number
        count = 0

        while number > 0:
            remainder = number % 10

            if remainder > 5:
                count += 1

            number //= 10

        return count

if __name__ == "__main__":
    input = PythonIsCool(67)

    print(f"Original number: {input.number}")
    print(f"Sum of all digits: {input.get_sum()}")
    print(f"Reversed sum of all digits: {input.get_reverse()}")
    print(f"Prime status of the reversed sum: {input.is_prime()}")
    print(f"Parity status of the reversed sum: {input.check_parity()}")
    print(f"Total count of digits greater than 5: {input.count_digits()}")