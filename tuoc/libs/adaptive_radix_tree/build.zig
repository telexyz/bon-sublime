const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    const lib = b.addSharedLibrary("tuoc", "test_art.zig", b.version(0, 0, 1));
    lib.linkSystemLibrary("c");
    lib.setBuildMode(mode);
    lib.install();
    lib.use_stage1 = true;

    const main_tests = b.addTest("test_art.zig");
    main_tests.setBuildMode(mode);
    main_tests.linkSystemLibrary("c");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
