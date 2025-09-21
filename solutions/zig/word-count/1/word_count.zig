const std = @import("std");
const mem = std.mem;

/// Returns the counts of the words in `s`.
/// Caller owns the returned memory.
pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    var hm = std.StringHashMap(u32).init(allocator);
    var it = std.mem.splitAny(u8, s, " ,.:!?&@$%^&\t\n\r");

    while (it.next()) |word| {
        const trimed = std.mem.trim(u8, word, "'");
        if (trimed.len == 0) continue;
        const normalized = try allocator.alloc(u8, trimed.len);
        for (trimed, 0..) |c, i| {
            normalized[i] = std.ascii.toLower(c);
        }
        if (hm.get(normalized)) |val| {
            try hm.put(normalized, val + 1);
            allocator.free(normalized);
        } else {
            try hm.put(normalized, 1);
        }
    }

    return hm;
}
