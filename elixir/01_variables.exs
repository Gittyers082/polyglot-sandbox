# Script Structure
# Basic binding
level = 20
name = "malemanape"
is_active = true

IO.puts("1. Basic Values:")
IO.puts("Level: #{level}, Name: #{name}, Active: #{is_active}")

# Immutability vs Rebinding
count = 5
IO.puts("\n2. Rebinding:")
IO.puts("Count before rebinding: #{count}")

count = count + 1
IO.puts("Count after rebinding: #{count}")

# Match Operator (=)
x = 10
10 = x

# Pattern Matching with Tuples
status_tuple = {:ok, "Success"}

{:ok, message} = status_tuple

IO.puts("\n3. Pattern Matching:")
IO.puts("Extracted Message: #{message}")

# Pin Operator (^)
y = 1
y = 2

^y = 2

IO.puts("\n4. Pin Operator:")
IO.puts("Pinned match succeeded for y = #{y}")

# Ignoring Values
{_status, result} = {:error, "Fail"}
IO.puts("Handled without warning: #{result}")
