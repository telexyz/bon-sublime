const std = @import("std");
const testing = std.testing;

const art = @import("art.zig");
const Art = art.Art;

pub fn main() !void {
    var t = Art(usize).init(&std.heap.page_allocator);
    defer {
        free_keys(&t) catch unreachable;
        t.deinit();
    }
    const filename = "words.txt";
    std.debug.print("\nImporting {s} ...", .{filename});
    const lines = try fileEachLine(doInsert, filename, &t, null);
    std.debug.print("\n{d} word inserted.", .{lines});
}

test "thử các tính năng của Adaptive Radix Tree" {
    var t = Art(usize).init(&std.testing.allocator);
    defer t.deinit();
    const words = [_][:0]const u8{
        "Aaron",
        "Aaronic",
        "Aaronical",
        "Aaronically",
        // "Aaronically_",
    };
    for (words) |w, i| {
        _ = try t.insert(w, i);
    }

    try testing.expect(t.search("Aaron") == .found);
    try testing.expect(t.search("aaron") != .found);

    const key: [:0]const u8 = "Aaronically";
    const result = t.search(key);
    try testing.expect(result == .found);

    const found = result.found;
    try testing.expectEqual(found.value, 3);
    try testing.expectEqualStrings(found.key[0..key.len], key[0..key.len]);

    _ = try t.iterPrefix("Aaronic", test_prefix_cb, .{}, art.Error!bool);
}

fn test_prefix_cb(node: anytype, _: anytype, _: usize) art.Error!bool {
    const leaf = node.*.leaf;
    std.debug.print("\n{s} -> {any}", .{ leaf.key, leaf.value });
    return false;
}

const TestingError = error{ TestUnexpectedResult, TestExpectedEqual } || art.Error;

test "insert many keys" {
    // var t = Art(usize).init(&std.heap.page_allocator);
    var t = Art(usize).init(&std.testing.allocator);
    defer {
        free_keys(&t) catch unreachable;
        t.deinit();
    }
    const filename = "words.txt";
    const lines = try fileEachLine(doInsert, filename, &t, null);
    try testing.expectEqual(t.size, lines);
}

fn fileEachLine(comptime do: fn (line: [:0]const u8, linei: usize, container: anytype, data: anytype) anyerror!void, filename: []const u8, container: anytype, data: anytype) !usize {
    const f = try std.fs.cwd().openFile(filename, .{ .mode = .read_only });
    defer f.close();

    var linei: usize = 1;
    const reader = &f.reader();
    var buf: [512:0]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        buf[line.len] = 0;
        try do(buf[0..line.len :0], linei, container, data);
        linei += 1;
    }
    return linei - 1;
}

fn free_keys(container: anytype) !void {
    const T = @TypeOf(container.*);
    if (T == std.StringHashMap(usize)) {
        var it = container.iterator();
        while (it.next()) |entry| {
            container.allocator.free(entry.key_ptr.*);
        }
    } else {
        const cbf = struct {
            pub fn f(n: *T.Node, tree: anytype, _: usize) TestingError!bool {
                tree.allocator.free(n.leaf.key);
                return false;
            }
        }.f;
        _ = try container.iter(cbf, container, TestingError!bool);
    }
}

const doInsert = struct {
    fn func(line: [:0]const u8, linei: usize, container: anytype, _: anytype) anyerror!void {
        const line_ = try container.allocator.dupeZ(u8, line);
        const result = try container.insert(line_, linei);
        try testing.expect(result == .missing);
    }
}.func;
