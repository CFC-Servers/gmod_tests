return WithTestEntity( {
    groupName = "Entity:Activate",

    cases = {
        {
            name = "Exists on the Entity Metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.Activate ).to.beA( "function" )
            end
        },

        {
            name = "Does not Error",
            func = function( state )
                local ent = state.ent
                expect( ent.Activate, ent ).to.succeed()
            end
        },

        -- TODO:
        -- Constraint tests
        -- "For some entity types when this function is used after Entity:SetModelScale, the physics object will be recreated with the new scale."
        -- "Calling this method after Entity:SetModelScale will recreate a new scaled SOLID_VPHYSICS PhysObj on scripted entities"
        -- sent_ball test?
    }
} )
