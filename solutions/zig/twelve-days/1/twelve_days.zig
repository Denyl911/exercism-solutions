const std = @import("std");
const nums = [_][]const u8{ "", "a", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve" };
const days = [_][]const u8{ "", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" };
const gifts = [_][]const u8{ "", "Partridge in a Pear Tree.", "Turtle Doves", "French Hens", "Calling Birds", "Gold Rings", "Geese-a-Laying", "Swans-a-Swimming", "Maids-a-Milking", "Ladies Dancing", "Lords-a-Leaping", "Pipers Piping", "Drummers Drumming" };

pub fn recite(buffer: []u8, sv: u32, ev: u32) []const u8 {
    var fbs = std.io.fixedBufferStream(buffer);
    const writer = fbs.writer();
    var i: u32 = sv;
    while (i <= ev) : (i += 1) {
        std.fmt.format(writer, "On the {s} day of Christmas my true love gave to me: ", .{days[i]}) catch unreachable;
        var j: u32 = i;
        while (j > 0) : (j -= 1) {
            std.fmt.format(writer, "{s} {s}", .{ nums[j], gifts[j] }) catch unreachable;
            if (j - 1 >= 1) writer.writeAll(", ") catch unreachable;
            if (j - 1 == 1) writer.writeAll("and ") catch unreachable;
        }
        if (i + 1 <= ev) writer.writeAll("\n") catch unreachable;
    }
    return fbs.getWritten();
}
