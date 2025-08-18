const std = @import("std");

const nums = [_][]const u8{
    "No",  "One",   "Two",   "Three", "Four", "Five",
    "Six", "Seven", "Eight", "Nine",  "Ten",
};

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) []const u8 {
    var fbs = std.io.fixedBufferStream(buffer);
    const writer = fbs.writer();

    for (0..take_down) |i| {
        const current_count = start_bottles - i;
        const next_count = current_count - 1;

        const current_str = nums[current_count];
        const next_str = nums[next_count];

        const s1 = if (current_count == 1) "" else "s";
        const s2 = if (next_count == 1) "" else "s";

        std.fmt.format(
            writer,
            "{s} green bottle{s} hanging on the wall,\n" ++
                "{s} green bottle{s} hanging on the wall,\n" ++
                "And if one green bottle should accidentally fall,\n" ++
                "There'll be {c}{s} green bottle{s} hanging on the wall.",
            .{
                current_str,                    s1,
                current_str,                    s1,
                std.ascii.toLower(next_str[0]), next_str[1..],
                s2,
            },
        ) catch {
            return "Error";
        };

        if (i < take_down - 1) {
            writer.writeAll("\n\n") catch {
                return "Error";
            };
        }
    }

    return fbs.getWritten();
}
