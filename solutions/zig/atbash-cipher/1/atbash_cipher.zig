const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).empty;
    var i: u8 = 0;
    for (s) |c| {
        const x = switch (c) {
            'a'...'m' => 'z' - (c - 'a'),
            'n'...'z' => 'a' + ('z' - c),
            'A'...'M' => 'z' - (c - 'A'),
            'N'...'Z' => 'a' + ('Z' - c),
            '0'...'9' => c,
            else => continue,
        };

        if (i == 5) {
            try arr.append(allocator, ' ');
            i = 0;
        }

        try arr.append(allocator, x);
        i += 1;
    }
    return arr.toOwnedSlice(allocator);
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).empty;
    for (s) |c| {
        switch (c) {
            'a'...'m' => try arr.append(allocator, ('z' - (c - 'a'))),
            'n'...'z' => try arr.append(allocator, 'a' + ('z' - c)),
            'A'...'M' => try arr.append(allocator, ('z' - (c - 'A'))),
            'N'...'Z' => try arr.append(allocator, 'a' + ('Z' - c)),
            '0'...'9' => try arr.append(allocator, c),
            else => continue,
        }
    }
    return arr.toOwnedSlice(allocator);
}
