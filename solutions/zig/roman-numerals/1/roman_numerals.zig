const std = @import("std");
const mem = std.mem;

const romanSymbols = [_]struct {
    value: i16,
    symbol: []const u8,
}{
    .{ .value = 1000, .symbol = "M" },
    .{ .value = 900, .symbol = "CM" },
    .{ .value = 500, .symbol = "D" },
    .{ .value = 400, .symbol = "CD" },
    .{ .value = 100, .symbol = "C" },
    .{ .value = 90, .symbol = "XC" },
    .{ .value = 50, .symbol = "L" },
    .{ .value = 40, .symbol = "XL" },
    .{ .value = 10, .symbol = "X" },
    .{ .value = 9, .symbol = "IX" },
    .{ .value = 5, .symbol = "V" },
    .{ .value = 4, .symbol = "IV" },
    .{ .value = 1, .symbol = "I" },
};

pub fn toRoman(allocator: mem.Allocator, arabicNumeral: i16) mem.Allocator.Error![]u8 {
    var rest = arabicNumeral;
    var arr = std.ArrayList(u8).empty;

    for (romanSymbols) |entry| {
        while (rest >= entry.value) {
            try arr.appendSlice(allocator, entry.symbol);
            rest -= entry.value;
        }
    }

    return arr.toOwnedSlice(allocator);
}
