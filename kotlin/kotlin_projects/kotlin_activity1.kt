class KotlinIsCoolToo(val number: Int) {

    fun getSum(): Int {
        var sum = 0
        var temp = number

        while (temp > 0 ) {
            sum += temp % 10
            temp /= 10
        }
        return sum
    }

    fun getReverse(): Int {
        var sum = getSum()
        var reverse = 0

        while (sum != 0) {
            val remainder = sum % 10
            reverse = reverse * 10 + remainder
            sum /= 10
        }
        return reverse
    }

    fun isPrime(): Boolean {
        var number = getReverse()

        if (number <= 1) {
            return false
        }

        for (i in 2..(number / 2)) {
            if (number % i == 0) {
                return false
            }
        }
        return true
    }

    fun checkParity(): String {
        var number = getReverse()

        if (number % 2 == 0) {
            return "even"
        } else {
            return "odd"
        }
    }

    fun countDigits(): Int {
        var count = 0
        var temp = number 

        while (temp > 0) {
            val remainder = temp % 10

            if (remainder > 5) {
                count++
            }
            temp /= 10
        }
        return count
    }
}

fun main() {
    val input = KotlinIsCoolToo(6767)

    println("Original number: ${input.number}")
    println("Sum of all digits: ${input.getSum()}")
    println("Reversed sum of all digits: ${input.getReverse()}")
    println("Prime status of the reversed sum: ${input.isPrime()}")
    println("Parity status of the reversed sum: ${input.checkParity()}")
    println("Total count of digits greater than 5: ${input.countDigits()}")
}
