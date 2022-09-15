# Adapt from https://github.com/gwenzek/fastBPE/blob/master/test/test_zig.py

import ctypes
import sys
from pathlib import Path

ROOT = Path(__file__).parent
print(ROOT)

if sys.platform == "darwin":
    zig = ctypes.CDLL(str(ROOT / "zig-out/lib/libtuoc.0.0.1.dylib"))
else:
    zig = ctypes.CDLL(str(ROOT / "zig-out/lib/libtuoc.so"))

