const std = @import("std");
pub fn clean(phrase: []const u8) ?[10]u8 {
    var num = [_]u8{0} ** 10;
    var i: u8 = 0;
    for (phrase) |x| {
        if (std.ascii.isDigit(x)) {
            if (i == 10) return null;
            const n: u8 = x - '0';
            if (i == 0 or i == 3) {
                if (n > 1 and n <= 9) {
                    num[i] = x;
                    i += 1;
                }
                continue;
            }
            num[i] = x;
            i += 1;
        }
    }
    if (i == 10) return num;
    return null;
}
