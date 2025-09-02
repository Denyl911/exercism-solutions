pub fn isValid(s: []const u8) bool {
    var i: usize = s.len - 1;
    var x: u8 = 0;
    var total: usize = 0;

    while (i >= 0) : (i -= 1) {
        const c = s[i];
        switch (c) {
            '0'...'9' => {
                const d = c - '0';
                x += 1;
                if (x % 2 == 0) {
                    const doubled = if (d * 2 > 9) (d * 2) - 9 else d * 2;
                    total += doubled;
                } else {
                    total += d;
                }
            },
            ' ' => if (i == 0) break else continue,
            else => return false,
        }
        if (i == 0) break;
    }

    return x > 1 and total % 10 == 0;
}
