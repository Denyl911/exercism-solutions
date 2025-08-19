const std = @import("std");
const mem = std.mem;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    if (shiftKey == 0 or shiftKey == 26) {
        try arr.appendSlice(text);
    } else {
        for (text) |c| {
            if (std.ascii.isAlphabetic(c)) {
                var sum = c + shiftKey;
                if (sum > 122) sum -= 26;
                try arr.append(sum);
            } else {
                try arr.append(c);
            }
        }
    }
    return arr.toOwnedSlice();
}
