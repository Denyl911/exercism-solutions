const std = @import("std");

pub fn truncate(phrase: []const u8) []const u8 {
    var it = std.unicode.Utf8Iterator{ .bytes = phrase, .i = 0 };
    var counter: u8 = 0;
    while (it.nextCodepointSlice()) |_| {
        counter += 1;
        if (counter == 5) return phrase[0..it.i];
    }
    return phrase;
}
