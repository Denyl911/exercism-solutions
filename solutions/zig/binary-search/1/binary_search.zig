pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    if (items.len == 0) return null;
    var lo: usize = 0;
    var hi: usize = items.len - 1;
    while (lo <= hi) {
        const m: usize = lo + (hi - lo) / 2;
        if (items[m] == target) return m;

        if (items[m] < target) {
            lo = m + 1;
        } else {
            if (m == 0) return null;
            hi = m - 1;
        }
    }
    return null;
}
