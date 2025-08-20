pub fn primes(buffer: []u32, limit: u32) []u32 {
    var i: u8 = 0;
    var x: u32 = 2;
    while (x <= limit) : (x += 1) {
        if (isPrime(x)) {
            buffer[i] = x;
            i += 1;
        }
    }
    return buffer[0..i];
}

fn isPrime(n: u32) bool {
    if (n <= 1) return false;

    var i: u32 = 2;
    while (i < n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}
