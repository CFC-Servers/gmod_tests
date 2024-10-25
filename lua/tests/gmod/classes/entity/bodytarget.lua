return {
    groupName = "Entity:BodyTarget",

    afterEach = function( state )
        SafeRemoveEntity( state.ent )
    end,

    cases = {
        {
            name = "Exists on the Entity metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.BodyTarget ).to.beA( "function" )
            end
        },

        -- When operating on prop_physics
        {
            name = "Always returns a prop's WorldSpaceCenter",
            func = function( state )
                local ent = MakeTestEntity( "prop_physics", "models/props_c17/oildrum001.mdl", true, true )
                state.ent = ent

                local expected = ent:WorldSpaceCenter()

                do
                    local output = ent:BodyTarget( Vector( -1000, 5000, 0 ), false )
                    local x, y, z = output:Unpack()

                    expect( x ).to.equal( expected.x )
                    expect( y ).to.equal( expected.y )
                    expect( z ).to.equal( expected.z )
                end

                do
                    local output = ent:BodyTarget( Vector( 1000, -5000, 500 ), false )
                    local x, y, z = output:Unpack()

                    expect( x ).to.equal( expected.x )
                    expect( y ).to.equal( expected.y )
                    expect( z ).to.equal( expected.z )
                end
            end
        },
        {
            name = "Noisy parameter does nothing for props",
            func = function( state )
                local ent = MakeTestEntity( "prop_physics", "models/props_c17/oildrum001.mdl", true, true )
                state.ent = ent

                local origin = Vector( 100, 100, 0 )

                local noisyOutput = ent:BodyTarget( origin, true )
                local cleanOutput = ent:BodyTarget( origin, false )

                expect( noisyOutput:IsEqualTol( cleanOutput, 0 ) ).to.beTrue()
            end
        },

        -- NOTE:
        -- This 12.5 offset seems to apply to many NPCs
        {
            name = "Returns WorldSpaceCenter with a slight Z offset for npc_gman",
            func = function( state )
                local ent = MakeTestEntity( "npc_gman", "", true )
                state.ent = ent

                local worldSpaceCenter = ent:WorldSpaceCenter()
                local output = ent:BodyTarget( Vector( 0, 0, 0 ), false )

                expect( output.x ).to.equal( worldSpaceCenter.x )
                expect( output.y ).to.equal( worldSpaceCenter.y )
                expect( output.z ).to.aboutEqual( worldSpaceCenter.z + 12.5 )
            end
        },
        {
            name = "Noisy parameter applies Z-axis noise for npc_gman",
            func = function( state )
                local ent = MakeTestEntity( "npc_gman", "", true )
                state.ent = ent

                local cleanOutput = ent:BodyTarget( Vector( 0, 0, 0 ), false )
                local noisyOutput = ent:BodyTarget( Vector( 0, 0, 0 ), true )

                local difference = noisyOutput - cleanOutput

                expect( difference.x ).to.equal( 0 )
                expect( difference.y ).to.equal( 0 )
                expect( difference.z ).notTo.equal( 0 )
            end
        },

        -- Zombies have a 9.5 offset
        {
            name = "Returns WorldSpaceCenter with a slight Z offset for npc_zombie",
            func = function( state )
                local ent = MakeTestEntity( "npc_zombie", "", true ) --[[@as NPC]]
                state.ent = ent

                local worldSpaceCenter = ent:WorldSpaceCenter()
                local output = ent:BodyTarget( Vector( 0, 0, 0 ), false )

                expect( output.x ).to.equal( worldSpaceCenter.x )
                expect( output.y ).to.equal( worldSpaceCenter.y )
                expect( output.z ).to.equal( worldSpaceCenter.z + 9.5 )
            end
        },
        {
            name = "Returns a special calculation for flinching npc_zombie",
            func = function( state )
                local ent = MakeTestEntity( "npc_zombie", "", true ) --[[@as NPC]]
                state.ent = ent

                ent:SetSchedule( SCHED_BIG_FLINCH )
                local pos = ent:GetPos()
                local headTarget = ent:HeadTarget( Vector( 0, 0, 0 ) )
                local expectedZ = (pos.z + headTarget.z) / 2

                local worldSpaceCenter = ent:WorldSpaceCenter()
                local output = ent:BodyTarget( Vector( 0, 0, 0 ), false )

                expect( output.x ).to.equal( worldSpaceCenter.x )
                expect( output.y ).to.equal( worldSpaceCenter.y )
                expect( output.z ).to.equal( expectedZ )
            end
        },

        -- TODO: Special cases for Crows
        -- TODO: Special cases for Combine
        -- TODO: Special cases for Striders
        -- TODO: Special cases for Players in Vehicles
    }
}
