# zig run src/art.zig -lc
# zig run -Drelease-fast=true src/main.zig

# brew install hyperfine (nếu cần)
rm word.datrie
hyperfine --runs 1 --show-output "python3 test_datrie.py"
hyperfine --runs 1 --show-output "python3 test_datrie.py"


rm word.marisa
hyperfine --runs 1 --show-output "python3 test_datrie.py"
hyperfine --runs 1 --show-output "python3 test_datrie.py"

