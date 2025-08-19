const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    if (words.len == 0) return &[_][]u8{};
    var arr = std.ArrayList([]u8).init(allocator);
    if (words.len >= 2) {
        for (words, 0..) |w, i| {
            const next = if (i + 1 < words.len) words[i + 1] else break;
            try arr.append(try fmt.allocPrint(allocator, "For want of a {s} the {s} was lost.\n", .{ w, next }));
        }
    }
    try arr.append(try fmt.allocPrint(allocator, "And all for the want of a {s}.\n", .{words[0]}));
    return arr.toOwnedSlice();
}
