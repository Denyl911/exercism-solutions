const std = @import("std");

pub const Plant = enum(u8) {
    clover = 'C',
    grass = 'G',
    radishes = 'R',
    violets = 'V',
};

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var it = std.mem.splitScalar(u8, diagram, '\n');
    const r1 = it.first();
    const r2 = it.peek().?;
    const i: u8 = (student[0] - 'A') * 2;
    return .{ @enumFromInt(r1[i]), @enumFromInt(r1[i + 1]), @enumFromInt(r2[i]), @enumFromInt(r2[i + 1]) };
}
