## Trie

https://github.com/pytries
```
pip3 install datrie --target=/Users/t/Library/Application\ Support/Sublime\ Text/Lib/python33
pip3 install -U marisa-trie
```

https://marisa-trie.readthedocs.io/en/latest/benchmarks.html

> dict(unicode words -> word lenghts): about 600M
> list(unicode words) : about 300M
> BaseTrie from datrie library: about 70M
> marisa_trie.Trie: 7M

- - -

https://github.com/travisstaloch/art.zig import `~234k words` mất gần 1 phút, quá chậm!