const std = @import("std");
pub fn isValidIsbn10(s: []const u8) bool {
    var total: usize = 0;
    var count: u8 = 0;
    for (s) |c| {
        const value: u8 = switch (c) {
            '0'...'9' => c - '0', // Ascii to decimal
            'X' => if (count == 9) 10 else return false,
            '-' => continue,
            else => return false,
        };

        const x = 10 - count;
        total += value * x;
        count += 1;

        if (count > 10) return false;
    }

    if (count != 10) return false;
    return total % 11 == 0;
}
