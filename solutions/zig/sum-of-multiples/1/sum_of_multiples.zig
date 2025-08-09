const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var total: u64 = 0;
    var vals = std.ArrayList(u32).init(allocator);
    defer vals.deinit();
    for (factors) |f| {
        var counter: u32 = 1;
        while (counter < limit) : (counter += 1) {
            const x = f * counter;
            if (x >= limit) break;
            if (!mem.containsAtLeastScalar(u32, vals.items, 1, x)) {
                try vals.append(x);
                total += x;
            }
        }
    }
    return total;
}
