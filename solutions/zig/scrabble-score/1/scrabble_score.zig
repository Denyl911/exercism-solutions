pub fn score(s: []const u8) u32 {
    var counter: u32 = 0;
    for (s) |c| {
        var upper: u8 = c;
        if (c > 96) {
            upper = c - 32;
        }
        switch (upper) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => counter += 1,
            'D', 'G' => counter += 2,
            'B', 'C', 'M', 'P' => counter += 3,
            'F', 'H', 'V', 'W', 'Y' => counter += 4,
            'K' => counter += 5,
            'J', 'X' => counter += 8,
            'Q', 'Z' => counter += 10,
            else => unreachable,
        }
    }
    return counter;
}
