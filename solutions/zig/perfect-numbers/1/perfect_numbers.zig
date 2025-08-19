pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

pub fn classify(n: u64) Classification {
    if (n == 0) unreachable;
    var sum: usize = 0;
    for (1..n) |i| {
        if (n % i == 0) {
            sum += i;
        }
    }
    if (sum == n) {
        return .perfect;
    }
    if (sum > n) {
        return .abundant;
    }
    return .deficient;
}
