#!python3.8

import string, os
import datrie

trie = False
trie_file = '../data/words.datrie'
if os.path.exists(trie_file):
	trie = datrie.BaseTrie.load(trie_file)
else:
	trie = datrie.BaseTrie(string.ascii_lowercase)
	t = open("../data/words.txt", mode="r", encoding="utf-8").read()
	for w in t.split("\n"): trie[w] = 1
	trie.save(trie_file)

print(trie)

trie = datrie.Trie(string.ascii_lowercase)
t = open("../data/TudienAnhVietBeta.tab", mode="r", encoding="utf-8").read()
for w in t.split("\n"):
	ev = w.split("\t")
	if len(ev) >= 2: trie[ev[0]] = ev[1]
trie.save('../data/TudienAnhVietBeta.datrie')