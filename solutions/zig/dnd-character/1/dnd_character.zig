const std = @import("std");
const rand = std.crypto.random;

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {
    var arr: [4]i8 = .{ 0, 0, 0, 0 };
    for (0..4) |i| {
        arr[i] = rand.intRangeAtMost(i8, 1, 6);
    }
    std.mem.sort(i8, &arr, {}, comptime std.sort.desc(i8));
    var total: i8 = 0;
    for (0..3) |i| {
        total += arr[i];
    }
    return total;
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitution = ability();
        return .{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = constitution,
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 10 + modifier(constitution),
        };
    }
};
