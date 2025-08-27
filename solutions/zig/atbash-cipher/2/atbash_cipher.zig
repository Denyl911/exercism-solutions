const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).empty;
    var i: u8 = 0;
    for (s) |c| {
        if (codeChar(c)) |x| {
            if (i == 5) {
                try arr.append(allocator, ' ');
                i = 0;
            }
            try arr.append(allocator, x);
            i += 1;
        }
    }
    return arr.toOwnedSlice(allocator);
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).empty;
    for (s) |c| {
        if (codeChar(c)) |x| {
            try arr.append(allocator, x);
        }
    }
    return arr.toOwnedSlice(allocator);
}

fn codeChar(c: u8) ?u8 {
    return switch (c) {
        'a'...'z' => 'a' + 'z' - c,
        'A'...'Z' => 'a' + 'Z' - c,
        '0'...'9' => c,
        else => null,
    };
}
