return WithBotTestTools( {
    groupName = "CTakeDamageInfo:GetAttacker",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetAttacker ).to.beA( "function" )
            end
        },

        {
            name = "Returns an invalid entity by default",
            func = function( state )
                local attacker = state.dmgInfo:GetAttacker()
                expect( attacker ).to.beInvalid()
            end
        },

        {
            name = "Returns an entity object when a valid attacker is set",
            func = function( state )
                local dummyAttacker = ents.Create( "prop_physics" )
                dummyAttacker:Spawn()
                state.dummyAttacker = dummyAttacker

                state.dmgInfo:SetAttacker( dummyAttacker )
                local attacker = state.dmgInfo:GetAttacker()
                expect( attacker ).to.beA( "Entity" )
            end,
            cleanup = function( state )
                if IsValid( state.dummyAttacker ) then
                    SafeRemoveEntity( state.dummyAttacker )
                end
            end
        },

        {
            name = "Returns the correct entity set by SetAttacker (prop_physics)",
            func = function( state )
                local expectedAttacker = ents.Create( "prop_physics" )
                expectedAttacker:Spawn()
                state.expectedAttacker = expectedAttacker

                state.dmgInfo:SetAttacker( expectedAttacker )
                local actualAttacker = state.dmgInfo:GetAttacker()
                expect( actualAttacker ).to.equal( expectedAttacker )
            end,
            cleanup = function( state )
                if IsValid( state.expectedAttacker ) then
                    SafeRemoveEntity( state.expectedAttacker )
                end
            end
        },

        {
            name = "Returns the correct entity set by SetAttacker (npc_gman)",
            func = function( state )
                local expectedAttacker = ents.Create( "npc_gman" )
                expectedAttacker:Spawn()
                state.expectedAttacker = expectedAttacker

                state.dmgInfo:SetAttacker( expectedAttacker )
                local actualAttacker = state.dmgInfo:GetAttacker()
                expect( actualAttacker ).to.equal( expectedAttacker )
                expect( actualAttacker:GetClass() ).to.equal( "npc_gman" )
            end,
            cleanup = function( state )
                if IsValid( state.expectedAttacker ) then
                    SafeRemoveEntity( state.expectedAttacker )
                end
            end
        },

        {
            name = "Returns the correct entity set by SetAttacker (NextBot)",
            async = true,
            coroutine = true,
            timeout = 5,
            func = function( state )
                WaitForEmptyServer()
                local bots = state.addBots( 1 )
                local expectedAttacker = bots[1]

                state.dmgInfo:SetAttacker( expectedAttacker )
                local actualAttacker = state.dmgInfo:GetAttacker()

                expect( actualAttacker ).to.equal( expectedAttacker )

                done()
            end
        }
    }
} )

