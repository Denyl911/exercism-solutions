pub fn LinkedList(comptime T: type) type {
    return struct {
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,
        const Self = @This();

        pub fn push(self: *Self, node: *Node) void {
            if (self.last) |last| {
                node.prev = last;
                last.next = node;
                self.last = node;
            } else {
                self.first = node;
                self.last = node;
            }
            self.len += 1;
        }

        pub fn pop(self: *Self) ?*Node {
            if (self.last) |last| {
                const buff = last;
                if (last.prev) |prev_node| {
                    prev_node.next = last;
                    self.last = prev_node;
                } else {
                    self.first = null;
                }
                self.len -= 1;
                return buff;
            }
            return null;
        }

        pub fn shift(self: *Self) ?*Node {
            if (self.first) |first| {
                const buff = first;
                if (first.next) |next_node| {
                    next_node.prev = null;
                    self.first = next_node;
                } else {
                    self.first = null;
                    self.last = null;
                }
                self.len -= 1;
                return buff;
            }
            return null;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            if (self.first) |first| {
                node.next = first;
                first.prev = node;
                self.first = node;
            } else {
                self.first = node;
                self.last = node;
            }
            self.len += 1;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var del = false;
            if (node.prev) |prev_node| {
                prev_node.next = node.next;
                del = true;
            } else {
                if (self.first == node) {
                    self.first = node.next;
                    del = true;
                }
            }

            if (node.next) |next_node| {
                next_node.prev = node.prev;
                del = true;
            } else {
                if (self.last == node) {
                    self.last = node.prev;
                    del = true;
                }
            }
            if (del) self.len -= 1;
        }
    };
}
