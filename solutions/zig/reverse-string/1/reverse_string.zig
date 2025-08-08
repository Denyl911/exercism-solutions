const std = @import("std");
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    if (s.len == 0) return "";
    var fbs = std.io.fixedBufferStream(buffer);
    var writer = fbs.writer();
    var counter: usize = s.len - 1;
    while (counter >= 0) : (counter -= 1) {
        writer.writeByte(s[counter]) catch unreachable;
        if (counter == 0) break;
    }
    return fbs.getWritten();
}
