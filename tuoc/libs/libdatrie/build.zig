const std = @import("std");

inline fn thisDir() []const u8 {
    return comptime std.fs.path.dirname(@src().file) orelse ".";
}

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    const lib = b.addSharedLibrary("datrie", "main.zig", b.version(0, 0, 1));
    // lib.use_stage1 = true;
    lib.addIncludeDir(thisDir() ++ "/datrie/");
    lib.addCSourceFile(thisDir() ++ "/datrie/alpha-map.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/dstring.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/tail.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/trie.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/darray.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/fileutils.c", &.{});
    lib.addCSourceFile(thisDir() ++ "/datrie/trie-string.c", &.{});

    lib.install();
    lib.linkSystemLibrary("c");
    lib.setBuildMode(mode);

    const main_tests = b.addTest("main.zig");
    main_tests.setBuildMode(mode);
    main_tests.linkSystemLibrary("c");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
