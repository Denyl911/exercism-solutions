const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    const trimmed = std.mem.trim(u8, s, &std.ascii.whitespace);
    if (trimmed.len == 0) {
        return "Fine. Be that way!";
    }

    const is_question: bool = std.mem.indexOfScalar(u8, trimmed, '?') == trimmed.len - 1;
    var is_all_caps: bool = true;
    var has_letters: bool = false;

    for (trimmed) |c| {
        if (std.ascii.isAlphabetic(c)) {
            has_letters = true;
            if (std.ascii.isLower(c)) {
                is_all_caps = false;
            }
        }
    }

    if (is_all_caps and has_letters and is_question) {
        return "Calm down, I know what I'm doing!";
    }
    if (is_all_caps and has_letters) {
        return "Whoa, chill out!";
    }
    if (is_question) {
        return "Sure.";
    }
    return "Whatever.";
}
