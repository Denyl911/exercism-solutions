const std = @import("std");
const mem = std.mem;

pub fn factors(allocator: mem.Allocator, value: u64) mem.Allocator.Error![]u64 {
    var arr = std.ArrayList(u64).init(allocator);
    var n: u64 = value;
    while (n % 2 == 0) : (n /= 2) {
        try arr.append(2);
    }
    var i: u64 = 3;
    while (i <= std.math.sqrt(n)) : (i += 2) {
        while (n % i == 0) : (n /= i) {
            try arr.append(i);
        }
    }
    if (n > 2) try arr.append(n);
    return arr.toOwnedSlice();
}
