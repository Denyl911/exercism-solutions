const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var buf: [50]u8 = undefined;
    const lower = std.ascii.lowerString(&buf, str);
    for (lower, 0..) |charX, i| {
        if (charX == 0x20 or charX == 0x2d) continue; // ' ' or '-'
        for (lower, 0..) |charY, j| {
            if (i == j) continue;
            if (charX == charY) {
                return false;
            }
        }
    }
    return true;
}
