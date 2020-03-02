fn main() {
    struct User {
        username: String,
        email: String,
        active: bool,
        sign_in_count: u64,
    }

    // user1.email = String::from("anotheremail@example.com");

    fn build_user(email: String, username: String, active: bool, sign_in_count: u64) -> User {
        User {
            email,
            username,
            active,
            sign_in_count,
        }
    }

    let email = String::from("test@example.com");
    let username = String::from("testuser");
    let user = build_user(email, username, true, 1);

    println!("{}, {}, {}, {}", user.email, user.username, user.active, user.sign_in_count);
}
