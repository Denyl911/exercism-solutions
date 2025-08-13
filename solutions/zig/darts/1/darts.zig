const std = @import("std");
const math = std.math;
pub const Coordinate = struct {
    x_coord: f32,
    y_coord: f32,
    distance: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{
            .x_coord = x_coord,
            .y_coord = y_coord,
            .distance = math.sqrt(math.pow(f32, x_coord, 2.0) + math.pow(f32, y_coord, 2.0)),
        };
    }
    pub fn score(self: Coordinate) usize {
        if (self.distance <= 10 and self.distance > 5) {
            return 1;
        }
        if (self.distance <= 5 and self.distance > 1) {
            return 5;
        }
        if (self.distance <= 1 and self.distance >= 0) {
            return 10;
        }
        return 0;
    }
};
