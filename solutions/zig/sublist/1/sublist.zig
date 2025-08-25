const std = @import("std");

pub const Relation = enum {
    equal,
    sublist,
    superlist,
    unequal,
};

pub fn compare(list_one: []const i32, list_two: []const i32) Relation {
    if (std.mem.eql(i32, list_one, list_two)) return .equal;

    if (list_one.len == 0) return .sublist;

    if (list_two.len == 0) return .superlist;

    if (list_one.len > list_two.len) {
        if (std.mem.containsAtLeast(i32, list_one, 1, list_two)) return .superlist;
    } else {
        if (std.mem.containsAtLeast(i32, list_two, 1, list_one)) return .sublist;
    }

    return .unequal;
}
