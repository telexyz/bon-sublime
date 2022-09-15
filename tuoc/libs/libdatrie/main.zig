const std = @import("std");

const c = @cImport({
    @cInclude("trie.h");
});

pub fn main() !void {
    //
}

test "hello" {
    var trie = c.trie_fread("../../words.datrie");
    defer c.trie_free(trie);
}
