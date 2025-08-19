pub fn square_of_sum(n: u32) -> u32 {
    let mut i = 0;
    let mut sum = 0;
    while i <= n {
        sum += i;
        i += 1;
    }
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    let mut i = 0;
    let mut sum = 0;
    while i <= n {
        sum += i * i;
        i += 1;
    }
    sum
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
