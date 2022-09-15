#!python3

import marisa_trie
from os import path

trie = False
trie_file = 'words.marisa'
if path.exists(trie_file):
	trie = marisa_trie.Trie()
	trie.load(trie_file)
else:
	t = open("words.txt", mode="r", encoding="utf-8").read()
	trie = marisa_trie.Trie(t.split("\n"))
	trie.save(trie_file)

print(trie)