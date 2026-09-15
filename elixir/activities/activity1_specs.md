# Activity 1: Digit Analysis Program

## 🎯 Objective

Create an **Elixir** program (`.exs`) that solves the logic problem detailed below.

---

## 📋 Requirements

You must use standard Elixir coding conventions (proper snake_case naming, standard indentation, and idiomatic pattern matching/recursion).

### 1. Input

- A single positive integer (e.g., `3487`).

### 2. Processing

- **Sum:** Find the sum of all digits in the original number.
- **Reverse:** Reverse that sum using **arithmetic operations only**.
  - ⚠️ _Strict Constraint:_ Do **NOT** convert numbers to strings or arrays/lists to reverse them.
- **Prime Check:** Determine if the reversed sum is a prime number.
- **Parity Check:** Determine if the reversed sum is even or odd.
- **Filter Count:** Count how many individual digits in the original number are strictly greater than 5 (`> 5`).
- **Implementation:** Use iteration or recursion (recursion is preferred and idiomatic in Elixir) to perform the math and structural analysis.

### 3. Output

Your program must display the following data clearly:

1. Original number
2. Sum of all digits
3. Reversed sum of all digits
4. Prime status of the reversed sum (Is Prime / Not Prime)
5. Parity status of the reversed sum (Even / Odd)
6. Total count of digits greater than 5
