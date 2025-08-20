const std = @import("std");
pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var p: u32 = 2;
    var i: u32 = 0;
    var sieve = std.StaticBitSet(limit + 1).initFull();
    while (p <= limit) : (p += 1) {
        if (sieve.isSet(p)) {
            var x: u32 = p * p;
            while (x <= limit) : (x += p) {
                sieve.unset(x);
            }
            buffer[i] = p;
            i += 1;
        }
    }
    return buffer[0..i];
}
