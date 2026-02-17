const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var fbs = std.io.fixedBufferStream(buffer);
    if (n % 3 != 0 and n % 5 != 0 and n % 7 != 0) {
        _ = fbs.writer().print("{}", .{n}) catch |err| {
            std.debug.print("Error: {}\n", .{err});
        };
    }
    if (n % 3 == 0) {
        _ = fbs.write("Pling") catch |err| {
            std.debug.print("Error: {}\n", .{err});
        };
    }
    if (n % 5 == 0) {
        _ = fbs.write("Plang") catch |err| {
            std.debug.print("Error: {}\n", .{err});
        };
    }
    if (n % 7 == 0) {
        _ = fbs.write("Plong") catch |err| {
            std.debug.print("Error: {}\n", .{err});
        };
    }
    return fbs.getWritten();
}
