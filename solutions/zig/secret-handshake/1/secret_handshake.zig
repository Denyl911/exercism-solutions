const std = @import("std");
const mem = std.mem;

pub const Signal = enum {
    wink,
    double_blink,
    close_your_eyes,
    jump,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: u5) mem.Allocator.Error![]const Signal {
    var arr = std.ArrayList(Signal).init(allocator);
    if (number & 0b001 > 0) {
        try arr.append(.wink);
    }
    if (number & 0b010 > 0) {
        try arr.append(.double_blink);
    }
    if (number & 0b100 > 0) {
        try arr.append(.close_your_eyes);
    }
    if (number & 0b1000 > 0) {
        try arr.append(.jump);
    }
    if (number & 0b10000 > 0) {
        std.mem.reverse(Signal, arr.items);
    }
    return arr.toOwnedSlice();
}
