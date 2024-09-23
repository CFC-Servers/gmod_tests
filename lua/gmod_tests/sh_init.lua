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

if SERVER then
    --- Makes an entity for test purposes
    --- @param class string? The class of the entity
    --- @param model string? The model of the entity
    --- @param shouldSpawn boolean? Whether the entity should be :Spawn()'d
    MakeTestEntity = function( class, model, shouldSpawn )
        shouldSpawn = shouldSpawn == true

        local ent = ents.Create( class or "prop_physics" )
        ent:SetModel( model or "models/props_c17/oildrum001.mdl" )

        if shouldSpawn then
            ent:Spawn()
        end

        return ent
    end

    --- Sets up a testGroup to make a test ent for each test, and remove it after each test
    WithTestEntity = function( testGroup )
        testGroup.beforeEach = function( state )
            state.ent = MakeTestEntity()
        end

        testGroup.afterEach = function( state )
            SafeRemoveEntity( state.ent )
        end

        return testGroup
    end
end

hook.Add( "GLuaTest_StartedTestRun", "Yes", function( testGroups )
    local hasYes = false
    local groupCount = #testGroups

    local toRemove = {}

    for i = 1, groupCount do
        local group = testGroups[i]

        if group.yes then
            hasYes = true
        else
            table.insert( toRemove, 1, i )
        end
    end

    if not hasYes then return end

    for _, i in ipairs( toRemove ) do
        table.remove( testGroups, i )
    end
end )
