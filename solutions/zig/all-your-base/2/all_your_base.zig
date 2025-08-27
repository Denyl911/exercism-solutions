const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

/// Converts `digits` from `input_base` to `output_base`, returning a slice of digits.
/// Caller owns the returned memory.
pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;
    if (output_base < 2) return ConversionError.InvalidOutputBase;
    if (mem.containsAtLeastScalar(u32, digits, 1, input_base)) return ConversionError.InvalidDigit;

    var arr = std.ArrayList(u32).empty;
    var i: u32 = if (digits.len > 0) @as(u32, @intCast(digits.len)) - 1 else 0;
    var total: u32 = 0;

    for (digits) |d| {
        const n: u32 = d * std.math.pow(u32, input_base, i);
        total += n;
        if (i > 0) i -= 1;
    }

    if (total == 0) {
        try arr.append(allocator, 0);
    } else {
        while (total > 0) {
            try arr.append(allocator, total % output_base);
            total /= output_base;
        }
        mem.reverse(u32, arr.items);
    }

    return arr.toOwnedSlice(allocator);
}
