const std = @import("std");

pub fn encode(buffer: []u8, string: []const u8) []u8 {
    var writer = std.Io.Writer.fixed(buffer);
    var buff: u8 = undefined;
    var count: u8 = 0;
    for (string, 1..) |c, i| {
        if (c == buff) {
            count += 1;
        } else {
            buff = c;
            count = 1;
        }
        if (i < string.len and string[i] == c) continue;
        if (count > 1) {
            writer.print("{d}{c}", .{ count, c }) catch unreachable;
        } else {
            writer.writeByte(c) catch unreachable;
        }
    }
    return writer.buffered();
}

pub fn decode(buffer: []u8, string: []const u8) []u8 {
    var writer = std.Io.Writer.fixed(buffer);
    var buff: u8 = 0;
    for (string) |c| {
        if (std.ascii.isDigit(c)) {
            if (buff > 0) buff *= 10;
            buff += c - '0';
            continue;
        }
        if (buff == 0) {
            writer.writeByte(c) catch unreachable;
        }
        while (buff > 0) : (buff -= 1) {
            writer.writeByte(c) catch unreachable;
        }
        buff = 0;
    }
    return writer.buffered();
}
