const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    if (dna.len == 0) return "";
    const list = try allocator.alloc(u8, dna.len);
    for (dna, 0..dna.len) |c, i| {
        if (c == 'G') {
            list[i] = 'C';
            continue;
        }
        if (c == 'C') {
            list[i] = 'G';
            continue;
        }
        if (c == 'T') {
            list[i] = 'A';
            continue;
        }
        if (c == 'A') {
            list[i] = 'U';
        }
    }
    return list;
}
