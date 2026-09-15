defmodule ElixirIndividualActivity1 do
  @doc """
  Processes a positive integer to calculate its digit sum, mathematically reverse that sum without using strings
  or arrays, and analyze both the digits and the reversed result against specific numeric criteria.
  """

  # Requirement 0: Print the original number
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
    reverse_it(div(number, 10), reversed * 10 + rem(n,10))
  end

  # Requirement 3: Determine if the reversed sum is a prime number
  def is_prime?(number) when number <= 1, do: false
  def is_prime?(number) when number in [2, 3], do: true
  def is_prime?(number), do: check_divisor(number, 2)

  # Private functions for is_prime?()
  defp check_divisor(number, divisor) when divisor * divisor > number n, do: true
  defp check_divisor(number, divisor) when rem(number, divisor) == 0, do: false
  defp check_divisor(number, divisor), do: check_divisor(number, divisor + 1)


end
