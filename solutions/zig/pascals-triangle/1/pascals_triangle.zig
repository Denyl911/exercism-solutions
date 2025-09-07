const std = @import("std");
const mem = std.mem;

pub fn rows(allocator: mem.Allocator, count: usize) mem.Allocator.Error![][]u128 {
    var arr1 = try allocator.alloc([]u128, count);
    for (0..count) |i| {
        var arr2 = try allocator.alloc(u128, i + 1);
        for (0..i + 1) |j| {
            if (i > 1) {
                if (j > 0 and j < i) {
                    arr2[j] = arr1[i - 1][j - 1] + arr1[i - 1][j];
                    continue;
                }
            }
            arr2[j] = 1;
        }
        arr1[i] = arr2;
    }
    return arr1;
}
