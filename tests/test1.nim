when appType == "lib":
  proc add(a, b: int): int {.exportc, dynlib.} = a + b
else:
  import memorymodule

  type AddProc = proc(a, b: int): int {.cdecl.}

  const MODULE = slurp("test1.dll")

  var module = MemoryLoadLibrary(MODULE.cstring, MODULE.len)
  var fn = MemoryGetProcAddress(module, "add")
  if fn == nil:
    echo "add proc not found"
  else:
    echo "3 + 4 = ", cast[AddProc](fn)(3, 4)
