-- Helpers and utilities for the gmod_tests test suite
-- (TODO: Do these belong somewhere else)
AddCSLuaFile()

WHEN_NO_HUMANS = function()
    return #player.GetHumans() == 0
end

local jitVersion = jit.version
IS_BASE_BRANCH = jitVersion == "LuaJIT 2.0.4"
IS_64BIT_BRANCH = jitVersion == "LuaJIT 2.1.0-beta3"

-- NOTE: The names could be wrong. I took them from here: https://github.com/RaphaelIT7/obsolete-source-engine/blob/gmod/public/tier1/iconvar.h#L41
FCVAR_DEVELOPMENTONLY = bit.lshift( 1, 1 )
FCVAR_HIDDEN = bit.lshift( 1, 4 )
FCVAR_INTERNAL_USE = bit.lshift( 1, 15 )
FCVAR_RELOAD_MATERIALS = bit.lshift( 1, 20 )
FCVAR_RELOAD_TEXTURES = bit.lshift( 1, 21 )
FCVAR_MATERIAL_SYSTEM_THREAD = bit.lshift( 1, 23 )
FCVAR_ACCESSIBLE_FROM_THREADS = bit.lshift( 1, 25 )
FCVAR_AVAILABLE1 = bit.lshift( 1, 26 )
FCVAR_AVAILABLE2 = bit.lshift( 1, 27 )