const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var it = mem.splitAny(u8, words, " -_");
    var list = std.ArrayList(u8).init(allocator);
    while (it.next()) |word| {
        if (word.len > 0) {
            try list.append(std.ascii.toUpper(word[0]));
        }
    }
    return list.toOwnedSlice();
}
