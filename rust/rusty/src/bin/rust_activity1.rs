use std::io::{self, Write};

fn sum_of_digits(mut number: u64) -> u64 {
    let mut sum = 0;

    while number > 0 {
        sum += number % 10;
        number /= 10;
    }
    sum
}

fn main() {
    print!("Enter a postive integer: ");
    io::stdout().flush().unwrap();

    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    match input.trim().parse::<u64>() {
        Ok(number) => {
            let total_sum = sum_of_digits(number);
            println!("Original number: {}", number);
            println!("Sum of all digits: {}", total_sum);
        }
        Err(_) => {
            println!("Error: Input must be a positive integer! Your input: {}", input);
        }
    }
}
