const std = @import("std");
const mem = std.mem;

pub fn translate(allocator: mem.Allocator, phrase: []const u8) mem.Allocator.Error![]u8 {
    var arr = try std.ArrayList(u8).initCapacity(allocator, phrase.len + 2);
    var it = mem.splitScalar(u8, phrase, ' ');
    var actual0: usize = 0;

    while (it.next()) |sp| {
        try arr.appendSlice(allocator, sp);

        if (isVowel(arr.items[actual0]) or (arr.items[actual0] == 'x' and arr.items[actual0 + 1] == 'r') or (arr.items[actual0] == 'y' and sp[actual0 + 1] == 't')) {
            try arr.appendSlice(allocator, "ay");
            break;
        }
        while (!isVowel(arr.items[actual0])) {
            if (arr.items[actual0] == 'q' and arr.items[actual0 + 1] == 'u') {
                const q = arr.orderedRemove(actual0);
                try arr.append(allocator, q);
                const u = arr.orderedRemove(actual0);
                try arr.append(allocator, u);
            } else {
                const c = arr.orderedRemove(actual0);
                try arr.append(allocator, c);
                if (arr.items[actual0] == 'y') break;
            }
        }

        try arr.appendSlice(allocator, "ay");
        actual0 += sp.len + 2;

        if (it.peek()) |_| {
            try arr.append(allocator, ' ');
            actual0 += 1;
        }
    }
    return arr.toOwnedSlice(allocator);
}

fn isVowel(c: u8) bool {
    return switch (c) {
        'a' => true,
        'e' => true,
        'i' => true,
        'o' => true,
        'u' => true,
        else => false,
    };
}
