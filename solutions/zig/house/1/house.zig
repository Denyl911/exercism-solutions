const std = @import("std");
pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    const nouns = [_][]const u8{ "", "house that Jack built.", "malt", "rat", "cat", "dog", "cow with the crumpled horn", "maiden all forlorn", "man all tattered and torn", "priest all shaven and shorn", "rooster that crowed in the morn", "farmer sowing his corn", "horse and the hound and the horn" };
    const verbs = [_][]const u8{ "", "lay in", "ate", "killed", "worried", "tossed", "milked", "kissed", "married", "woke", "kept", "belonged to" };

    var writer = std.Io.Writer.fixed(buffer);
    var i: u32 = 0;

    while (start_verse + i <= end_verse) : (i += 1) {
        var j: u32 = start_verse + i - 1;
        writer.print("This is the {s}", .{nouns[start_verse + i]}) catch unreachable;

        while (j > 0) : (j -= 1) {
            writer.print(" that {s} the {s}", .{ verbs[j], nouns[j] }) catch unreachable;
        }

        if (start_verse + i < end_verse) {
            writer.writeAll("\n") catch unreachable;
        }
    }

    return writer.buffered();
}
