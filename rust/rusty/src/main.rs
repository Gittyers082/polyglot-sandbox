use std::io;

fn main() {
    println!("Character Setup");
    println!("Enter a core trait (strength, magic, stealth, empathy):");

    let mut input = String::new();

    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read input");

    let cleaned_input = input.trim().to_lowercase();

    match cleaned_input.as_str() {
        "strength" => println!("Class: Brawler. Focused on raw physical power and heavy lifting."),
        "magic" => println!("Class: Caster. Complex spell systems and lore."),
        "empathy" => println!("Class: Guardian. Focused on protecting allies and supporting the party."),
        "stealth" => println!("Class: Assassin. High agility and evasion."),
        _ => println!("Class: Hybrid. A balanced build across all stats."),
    }
}