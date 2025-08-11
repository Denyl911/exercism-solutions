const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();
    const sNum = std.fmt.allocPrint(allocator, "{d}", .{num}) catch unreachable;
    defer allocator.free(sNum);
    var total: u128 = 0;
    for (sNum) |n| {
        total += std.math.pow(u128, n - 48, sNum.len);
    }
    if (total == num) return true;
    return false;
}
