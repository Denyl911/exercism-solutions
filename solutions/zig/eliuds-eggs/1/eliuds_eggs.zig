pub fn eggCount(number: usize) usize {
    var it = number;
    var total: usize = 0;
    while (it > 0) : (it /= 2) {
        if (it % 2 == 1) total += 1;
    }
    return total;
}
