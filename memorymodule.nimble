
version       = "0.1.0"
author        = "Huy Doan"
description   = "MemoryModule wrapper for Nim"
license       = "MPL 2.0"
skipDirs      = @["tests"]

requires        "nim >= 1.2.0"


task test, "compile tests":
  withDir "tests":
    exec "nim c -d:release -d:mingw --app:lib test1.nim"
    exec "nim c -d:release -d:mingw test1.nim"
