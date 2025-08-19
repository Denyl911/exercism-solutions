pub fn is_armstrong_number(num: u32) -> bool {
    let digits = num
        .to_string()
        .chars()
        .map(|x| x.to_digit(10).unwrap())
        .collect::<Vec<_>>();
    let len: u32 = digits.len().try_into().unwrap();
    let mut sum = 0;
    digits.into_iter().for_each(|d| sum += d.pow(len));
    return sum == num;
}
