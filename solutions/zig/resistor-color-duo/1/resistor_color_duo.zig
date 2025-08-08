pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };
pub fn colorCode(colors: [2]ColorBand) usize {
    const val1 = @as(u8, @intFromEnum(colors[0]));
    const val2 = @as(u8, @intFromEnum(colors[1]));
    return (val1 * 10) + val2;
}
