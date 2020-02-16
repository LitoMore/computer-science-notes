fn main() {
    let mut s = String::from("hello world");

    let word = first_word(&s);
    println!("{}", word);

    s.clear();
}

fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}
