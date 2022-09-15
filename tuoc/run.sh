# zig run src/art.zig -lc
# zig run -Drelease-fast=true src/main.zig

# brew install hyperfine (nếu cần)
# 
rm ../data/word.datrie
hyperfine --runs 1 --show-output "python3.8 test_datrie.py"
hyperfine --runs 1 --show-output "python3.8 test_datrie.py"


rm ../data/word.marisa
hyperfine --runs 1 --show-output "python3 test_marisa.py"
hyperfine --runs 1 --show-output "python3 test_marisa.py"

