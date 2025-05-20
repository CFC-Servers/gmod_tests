if not SERVER then return end

--- Makes an entity for test purposes
--- @param class string? The class of the entity
--- @param model string? The model of the entity
--- @param shouldSpawn boolean? Whether the entity should be :Spawn()'d
--- @param shouldFreeze boolean? Whether the entity should be :Freeze()'d (only valid if shouldSpawn is true)
MakeTestEntity = function( class, model, shouldSpawn, shouldFreeze )
    shouldSpawn = shouldSpawn == true

    local ent = ents.Create( class or "prop_physics" )
    ent:SetModel( model or "models/props_c17/oildrum001.mdl" )

    if shouldSpawn then
        ent:Spawn()

        if shouldFreeze then
            local physObj = ent:GetPhysicsObject()
            physObj:EnableMotion( false )
        end
    end

    return ent
end

--- @class TestEntityConfig
--- @field class string? The class of the entity
--- @field model string? The model of the Entity
--- @field shouldSpawn boolean? Whether the entity should be :Spawn()'d
--- @field shouldFreeze boolean? Whether the entity should be :Freeze()'d (only valid if shouldSpawn is true)
--- @field createdCallback fun( ent: Entity )? A callback to run after the entity is created

--- Sets up a testGroup to make a test ent for each test, and remove it after each test
--- @param testGroup table The test group to modify
--- @param config TestEntityConfig? The configuration for the test entity
WithTestEntity = function( testGroup, config )
    config = config or {}

    testGroup.beforeEach = function( state )
        state.ent = MakeTestEntity( config.class, config.model, config.shouldSpawn, config.shouldFreeze )

        local cb = config.createdCallback
        if cb then cb( state.ent ) end
    end

    testGroup.afterEach = function( state )
        SafeRemoveEntity( state.ent )
    end

    return testGroup
end
