const std = @import("std");

pub fn prime(allocator: std.mem.Allocator, number: usize) !usize {
    const nf: f64 = @floatFromInt(number);
    const upper_bound: usize = if (number < 6) 15 else @intFromFloat(nf * (@log(nf) + @log(@log(nf))));

    var is_prime = try allocator.alloc(bool, upper_bound + 1);
    defer allocator.free(is_prime);
    @memset(is_prime, true);

    var p: usize = 2;
    while (p * p <= upper_bound) : (p += 1) {
        if (is_prime[p]) {
            var i = p * p;
            while (i <= upper_bound) : (i += p) {
                is_prime[i] = false;
            }
        }
    }

    var count: usize = 0;
    var n: usize = 2;
    while (n <= upper_bound) : (n += 1) {
        if (is_prime[n]) {
            count += 1;
            if (count == number) {
                return n;
            }
        }
    }

    return error.NthPrimeNotFound;
}
