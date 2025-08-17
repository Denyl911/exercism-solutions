const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var bufset = std.BufSet.init(allocator);
    const wordLower = try std.ascii.allocLowerString(allocator, word);
    defer allocator.free(wordLower);

    for (candidates) |c| {
        const lower = try std.ascii.allocLowerString(allocator, c);
        defer allocator.free(lower);

        if (c.len == word.len and !std.mem.eql(u8, wordLower, lower)) {
            const m = mem.indexOfNone(u8, wordLower, lower);
            var sumW: usize = 0;
            var sumC: usize = 0;

            for (wordLower, lower) |x, y| {
                sumW += x;
                sumC += y;
            }

            if (m == null and sumW == sumC) {
                try bufset.insert(c);
            }
        }
    }
    return bufset;
}
