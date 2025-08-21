const NUMS: [&str; 11] = [
    "No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
];

pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let mut res = String::new();
    let mut i = 0;
    while i < take_down {
        let current_count = start_bottles - i;
        let next_count = current_count - 1;

        let current_str = NUMS.get(current_count as usize).expect("Invalid Index");
        let next_str = NUMS
            .get(next_count as usize)
            .expect("Invalid index")
            .to_lowercase();

        let s1 = if current_count == 1 { "" } else { "s" };
        let s2 = if next_count == 1 { "" } else { "s" };

        res.push_str(&format!("{current_str} green bottle{s1} hanging on the wall,\n{current_str} green bottle{s1} hanging on the wall,\nAnd if one green bottle should accidentally fall,\nThere'll be {next_str} green bottle{s2} hanging on the wall."));

        if i < take_down - 1 {
            res.push_str("\n\n");
        }

        i += 1;
    }
    res
}
