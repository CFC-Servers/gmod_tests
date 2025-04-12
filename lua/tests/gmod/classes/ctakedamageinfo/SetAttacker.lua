return WithBotTestTools( {
    groupName = "CTakeDamageInfo:SetAttacker",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetAttacker ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local dummyEnt = ents.Create( "prop_physics" )
                dummyEnt:Spawn()
                state.dummyEnt = dummyEnt

                local result = state.dmgInfo:SetAttacker( dummyEnt )
                expect( result ).to.beNil()
            end,
            cleanup = function( state )
                if IsValid( state.dummyEnt ) then SafeRemoveEntity( state.dummyEnt ) end
            end
        },

        {
            name = "Sets attacker correctly (prop_physics)",
            func = function( state )
                local expectedAttacker = ents.Create( "prop_physics" )
                expectedAttacker:Spawn()
                state.expectedAttacker = expectedAttacker

                state.dmgInfo:SetAttacker( expectedAttacker )
                expect( state.dmgInfo:GetAttacker() ).to.equal( expectedAttacker )
            end,
            cleanup = function( state )
                if IsValid( state.expectedAttacker ) then SafeRemoveEntity( state.expectedAttacker ) end
            end
        },

        {
            name = "Sets attacker correctly (npc_gman)",
            func = function( state )
                local expectedAttacker = ents.Create( "npc_gman" )
                expectedAttacker:Spawn()
                state.expectedAttacker = expectedAttacker

                state.dmgInfo:SetAttacker( expectedAttacker )
                expect( state.dmgInfo:GetAttacker() ).to.equal( expectedAttacker )
            end,
            cleanup = function( state )
                if IsValid( state.expectedAttacker ) then SafeRemoveEntity( state.expectedAttacker ) end
            end
        },

        {
            name = "Sets attacker correctly (NextBot)",
            async = true,
            coroutine = true,
            timeout = 5,
            func = function( state )
                WaitForEmptyServer()
                local bots = state.addBots( 1 )
                local expectedAttacker = bots[1]

                state.dmgInfo:SetAttacker( expectedAttacker )
                expect( state.dmgInfo:GetAttacker() ).to.equal( expectedAttacker )

                done()
            end
        },

        {
            name = "Overwrites previously set attacker",
            func = function( state )
                local attacker1 = ents.Create( "prop_physics" )
                attacker1:Spawn()
                state.attacker1 = attacker1

                local attacker2 = ents.Create( "prop_physics" )
                attacker2:Spawn()
                state.attacker2 = attacker2

                state.dmgInfo:SetAttacker( attacker1 )
                state.dmgInfo:SetAttacker( attacker2 )

                expect( state.dmgInfo:GetAttacker() ).to.equal( attacker2 )
            end,
            cleanup = function( state )
                if IsValid( state.attacker1 ) then SafeRemoveEntity( state.attacker1 ) end
                if IsValid( state.attacker2 ) then SafeRemoveEntity( state.attacker2 ) end
            end
        },
        {
            name = "Errors when given NULL",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAttacker( NULL ) end
                expect( testFunc ).to.errWith( [[Tried to use a NULL entity!]] )
            end,
            cleanup = function( state )
                if IsValid( state.dummyEnt ) then SafeRemoveEntity( state.dummyEnt ) end
            end
        },


        {
            name = "Errors when given a non-Entity argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAttacker( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetAttacker' (Entity expected, got number)]] )
            end
        },

        {
            name = "Errors when given a non-Entity argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAttacker( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetAttacker' (Entity expected, got string)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAttacker() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetAttacker' (Entity expected, got no value)]] )
            end
        }
    }
} )

