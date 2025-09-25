const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(u8) { black, brown, red, orange, yellow, green, blue, violet, grey, white };
const kilo = 1_000;
const mega = 1_000_000;
const giga = 1_000_000_000;

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const num: u64 = ((@intFromEnum(colors[0]) * 10) + @intFromEnum(colors[1])) * std.math.pow(u64, 10, @intFromEnum(colors[2]));
    if (num >= giga) {
        return std.fmt.allocPrint(allocator, "{d} gigaohms", .{@as(f64, @floatFromInt(num)) / giga});
    }
    if (num >= mega) {
        return std.fmt.allocPrint(allocator, "{d} megaohms", .{@as(f64, @floatFromInt(num)) / mega});
    }
    if (num >= kilo) {
        return std.fmt.allocPrint(allocator, "{d} kiloohms", .{@as(f64, @floatFromInt(num)) / kilo});
    }
    return std.fmt.allocPrint(allocator, "{d} ohms", .{num});
}
