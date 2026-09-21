class RubyIsRed
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def get_sum
    sum = 0
    temp = @number

    while temp > 0 
      sum += temp % 10
      temp /= 10
    end

    return sum
  end

  def get_reverse
    sum = get_sum()
    reverse = 0

    while sum != 0
      remainder = sum % 10
      reverse = reverse * 10 + remainder
      sum /= 10
    end

    return reverse
  end

  def is_prime
    num = get_reverse()

    if num <= 1
      return false
    end

    (2..(num / 2)).each do |i|
      if num % i == 0
        return false
      end
    end

    return true
  end

  def check_parity
    num = get_reverse()

    if num % 2 == 0
      return "even"
    else
      return "odd"
    end
  end

  def count_digits
    num = @number
    count = 0

    while num > 0
      remainder = num % 10

      if remainder > 5
        count += 1
      end

      num /= 10
    end

    return count
  end
end

if __FILE__ == $0
  input = RubyIsRed.new(21213)

  puts"Original number: #{input.number}"
  puts"Sum of all digits: #{input.get_sum()}"
  puts"Reversed sum of all digits: #{input.get_reverse()}"
  puts"Prime status of the reversed sum: #{input.is_prime()}"
  puts"Parity status of the reversed sum: #{input.check_parity()}"
  puts"Total count of digits greater than 5: #{input.count_digits()}"
end
