#!python3

import string
import datrie
from os import path

trie = False
trie_file = 'words.datrie'
if path.exists(trie_file):
	trie = datrie.BaseTrie.load(trie_file)
else:
	trie = datrie.BaseTrie(string.ascii_lowercase)
	t = open("words.txt", mode="r", encoding="utf-8").read()
	for w in t.split("\n"):
		trie[w] = 1
	trie.save(trie_file)

print(trie)

trie = datrie.Trie(string.ascii_lowercase)
t = open("../TudienAnhVietBeta.tab", mode="r", encoding="utf-8").read()
for w in t.split("\n"):
	ev = w.split("\t")
	if len(ev) >= 2: trie[ev[0]] = ev[1]
trie.save('TudienAnhVietBeta.datrie')