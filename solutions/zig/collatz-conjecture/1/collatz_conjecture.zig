pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    var count: usize = 0;
    if (number == 0) return ComputationError.IllegalArgument;
    if (number == 1) return count;
    count += 1;
    if (number % 2 == 0) {
        count += try steps(number / 2);
    } else {
        count += try steps(number * 3 + 1);
    }
    return count;
}
