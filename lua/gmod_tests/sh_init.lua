-- Helpers and utilities for the gmod_tests test suite
-- (TODO: Do these belong somewhere else)
AddCSLuaFile()

local jitVersion = jit.version
IS_BASE_BRANCH = jitVersion == "LuaJIT 2.0.4"
IS_64BIT_BRANCH = jitVersion == "LuaJIT 2.1.0-beta3"
