const std = @import("std");
pub const SeriesError = error{
    InvalidCharacter,
    NegativeSpan,
    InsufficientDigits,
};

pub fn largestProduct(digits: []const u8, span: i32) SeriesError!u64 {
    if (span < 0) return SeriesError.NegativeSpan;
    if (span > digits.len) return SeriesError.InsufficientDigits;
    if (digits.len == 0 or span == 0) return 1;

    var max: u64 = 0;
    var i: u8 = 0;
    while (i <= digits.len - @as(u32, @intCast(span))) : (i += 1) {
        if (!std.ascii.isDigit(digits[i])) return SeriesError.InvalidCharacter;

        var j: u8 = 1;
        var total: u64 = digits[i] - '0';

        while (j < span) : (j += 1) {
            total *= digits[i + j] - '0';
        }
        if (total > max) max = total;
    }
    return max;
}
