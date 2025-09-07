const std = @import("std");
const mem = std.mem;

const openers = [_]u8{ '[', '{', '(' };
const closers = [_]u8{ ']', '}', ')' };

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var arr = std.ArrayList(usize).empty;
    defer arr.deinit(allocator);
    for (s) |c| {
        if (mem.indexOfScalar(u8, &closers, c)) |index| {
            const last = arr.pop();
            if (last != index) return false;
        }
        if (mem.indexOfScalar(u8, &openers, c)) |index| {
            try arr.append(allocator, index);
        }
    }
    if (arr.getLastOrNull() != null) return false;
    return true;
}
