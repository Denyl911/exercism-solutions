const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum(u8) {
    eggs = 1,
    peanuts = 2,
    shellfish = 4,
    strawberries = 8,
    tomatoes = 16,
    chocolate = 32,
    pollen = 64,
    cats = 128,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    const n: u8 = @intFromEnum(allergen);
    return score & n > 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var en = EnumSet(Allergen).initFull();
    var it = en.iterator();
    while (it.next()) |x| {
        const n = @intFromEnum(x);
        if (score & n == 0) {
            en.remove(x);
        }
    }
    return en;
}
