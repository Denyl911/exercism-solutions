pub fn squareRoot(radicand: usize) usize {
    if (radicand < 2) return radicand;
    var result: usize = 0;
    var lo: usize = 1;
    var hi: usize = radicand / 2;
    while (lo <= hi) {
        const m = (lo + hi) / 2;
        const sqr = m * m;
        if (sqr == radicand) return m;
        if (sqr < radicand) {
            lo = m + 1;
            result = m;
        } else {
            hi = m - 1;
        }
    }
    return result;
}
