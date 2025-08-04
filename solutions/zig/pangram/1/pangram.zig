const std = @import("std");
pub fn isPangram(str: []const u8) bool {
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |c| {
        const index = switch (c) {
            inline 'a'...'z' => |l| l - 'a',
            inline 'A'...'Z' => |l| l - 'A',
            else => continue,
        };
        letters.set(index);
    }
    if (letters.count() == 26) return true;
    return false;
}
