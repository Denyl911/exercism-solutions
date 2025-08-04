pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var counter = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |c| {
        switch (c) {
            'A' => counter.a += 1,
            'C' => counter.c += 1,
            'G' => counter.g += 1,
            'T' => counter.t += 1,
            else => return NucleotideError.Invalid,
        }
    }
    return counter;
}
