const std = @import("std");

pub fn truncate(phrase: []const u8) []const u8 {
    const utf8 = std.unicode.Utf8View.init(phrase) catch unreachable;
    var it = utf8.iterator();
    var counter: u8 = 0;
    while (it.nextCodepointSlice()) |_| {
        counter += 1;
        if (counter == 5) return phrase[0..it.i];
    }
    return phrase;
}
