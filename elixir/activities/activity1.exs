defmodule CruzElixirIndividualActivity1 do
  @doc """
  Processes a positive integer to calculate its digit sum, mathematically reverse that sum without using strings
  or arrays, and analyze both the digits and the reversed result against specific numeric criteria.
  """

  # Requirement 0: Return the original number
  def original_number(number) do
    number
  end

  # Requirement 1: Find the sum of all digits
  def sum_digits(number) when is_integer(number) do
    number
    |> abs()
    |> Integer.digits()
    |> Enum.sum()
  end

  # Requirement 2: Reverse the sum using arithmetic operations
  def reversed_sum(number) when is_integer(number) do
    sum = sum_digits(number)
    reverse_it(sum, 0)
  end

  # Requirement 2.1: Reversing using aritmetic operations
  # Private functions for reversed_sum()
  defp reverse_it(0, reversed), do: reversed
  defp reverse_it(number, reversed) do
    reverse_it(div(number, 10), reversed * 10 + rem(number, 10))
  end

  # Requirement 3: Determine if the reversed sum is a prime number
  def is_prime?(number) when number <= 1, do: false
  def is_prime?(number) when number in [2, 3], do: true
  def is_prime?(number), do: check_divisor(number, 2)

  # Private functions for is_prime?()
  defp check_divisor(number, divisor) when divisor * divisor > number, do: true
  defp check_divisor(number, divisor) when rem(number, divisor) == 0, do: false
  defp check_divisor(number, divisor), do: check_divisor(number, divisor + 1)


  # Requirement 4: Determine if the reversed sum is an even or odd number
  def check_parity(number) when rem(number, 2) == 0, do: "even"
  def check_parity(_number), do: "odd"

  # Requirement 5: Count how many digits in the original number are greater than 5
  def count_greater_than_five(0), do: 0
  def count_greater_than_five(number) do
    last_digit = rem(number, 10)
    remaining_number = div(number, 10)
    count = if last_digit > 5, do: 1, else: 0
    count + count_greater_than_five(remaining_number)
  end

  # Extra Feature: Catches all bad inputs
  def output(number) when not is_integer(number) or number <= 0 do
    IO.puts("Error: Input must be a positive integer! Your input: #{inspect(number)}")
    IO.puts(String.duplicate("=-=", 20))
  end

  # Output Requirement
  def output(number) do
    sum = sum_digits(number)
    rev_sum = reversed_sum(number)

    IO.puts("Original number: #{original_number(number)}")
    IO.puts("Sum of all digits: #{sum}")
    IO.puts("Reversed sum of all digits: #{rev_sum}")
    IO.puts("Whether the reversed sum is prime: #{is_prime?(rev_sum)}")
    IO.puts("Whether the reversed sum is an even or odd number: #{check_parity(rev_sum)}")
    IO.puts("Count of digits greater than 5: #{count_greater_than_five(number)}")
    IO.puts(String.duplicate("=-=", 20))
  end

end

# Good Inputs
CruzElixirIndividualActivity1.output(1)
CruzElixirIndividualActivity1.output(2)
CruzElixirIndividualActivity1.output(67)
CruzElixirIndividualActivity1.output(9000)
CruzElixirIndividualActivity1.output(1_000_000_000_000_000)

# Bad Inputs
CruzElixirIndividualActivity1.output(0)
CruzElixirIndividualActivity1.output(67.0)
CruzElixirIndividualActivity1.output(-67)
CruzElixirIndividualActivity1.output("six seven")
CruzElixirIndividualActivity1.output(nil)
