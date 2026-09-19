use std::io::{self, Write};

fn sum_of_digits(mut number: u64) -> u64 {
    let mut sum = 0;

    while number > 0 {
        sum += number % 10;
        number /= 10;
    }
    sum
}

fn reversed_sum(number: u64) -> u64 {
    let mut sum = sum_of_digits(number);
    let mut reverse = 0;

    while sum != 0 {
        let remainder = sum % 10;
        reverse = reverse * 10 + remainder;
        sum /= 10;
    }
    reverse
}

fn is_prime(number: u64) -> bool {
    if number <= 1 {
        return false;
    }

    for i in 2..=(number / 2) {
        if number % i == 0 {
            return false;
        }
    }
    true
}

fn check_parity(number: u64) -> &'static str {
    if number % 2 == 0 {
        "even"
    } else {
        "odd"
    }
}

fn count_digits_greater_than_five(mut number: u64) -> u64 {
    let mut count = 0;

    while number > 0 {
        let remainder = number % 10;

        if remainder > 5 {
            count+= 1;
        }
        number /= 10;
    }
    count
}
 
fn main() {
    print!("Enter a postive integer: ");
    io::stdout().flush().unwrap();

    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    match input.trim().parse::<u64>() {
        Ok(number) => {
            let total_sum = sum_of_digits(number);
            let reverse_sum = reversed_sum(number);
            let prime_stats = is_prime(reverse_sum);
            let parity_stats = check_parity(reverse_sum);
            let count = count_digits_greater_than_five(number);

            println!("Original number: {}", number);
            println!("Sum of all digits: {}", total_sum);
            println!("Reversed sum of all digits: {}", reverse_sum);
            println!("Prime status of the reversed sum: {}", prime_stats);
            println!("Parity status of the reversed sum: {}", parity_stats);
            println!("Total count of digits greater than 5: {}", count);

        }
        Err(_) => {
            println!("Error: Input must be a positive integer! Your input: {}", input);
        }
    }
}
