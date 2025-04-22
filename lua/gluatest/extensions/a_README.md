General rules for our gmod_tests extensions:
- Each tool should have its own file
- Tools should be named clearly
- Tools requiring multiple files should:
  - Have one top-level file that includes (and AddCSLuaFile's) all the other files
  - Have a directory with the same name as the file, (i.e. `my_tool.lua` and `my_tool/`) that contains all required files
- Each file should `AddCSLuaFile()` itself unless it's explicitly server-only
