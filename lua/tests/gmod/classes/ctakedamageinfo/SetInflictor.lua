return {
    groupName = "CTakeDamageInfo:SetInflictor",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetInflictor ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local dummyEnt = ents.Create( "prop_physics" )
                dummyEnt:Spawn()
                state.dummyEnt = dummyEnt

                local result = state.dmgInfo:SetInflictor( dummyEnt )
                expect( result ).to.beNil()
            end,
            cleanup = function( state )
                if IsValid( state.dummyEnt ) then SafeRemoveEntity( state.dummyEnt ) end
            end
        },

        {
            name = "Sets inflictor correctly (weapon entity)",
            func = function( state )
                local expectedInflictor = ents.Create( "weapon_pistol" )
                expectedInflictor:Spawn()
                state.expectedInflictor = expectedInflictor

                state.dmgInfo:SetInflictor( expectedInflictor )
                expect( state.dmgInfo:GetInflictor() ).to.equal( expectedInflictor )
            end,
            cleanup = function( state )
                if IsValid( state.expectedInflictor ) then SafeRemoveEntity( state.expectedInflictor ) end
            end
        },

        {
            name = "Sets inflictor correctly (non-weapon entity)",
            func = function( state )
                local expectedInflictor = ents.Create( "prop_physics" )
                expectedInflictor:Spawn()
                state.expectedInflictor = expectedInflictor

                state.dmgInfo:SetInflictor( expectedInflictor )
                expect( state.dmgInfo:GetInflictor() ).to.equal( expectedInflictor )
            end,
            cleanup = function( state )
                if IsValid( state.expectedInflictor ) then SafeRemoveEntity( state.expectedInflictor ) end
            end
        },

        {
            name = "Overwrites previously set inflictor",
            func = function( state )
                local inflictor1 = ents.Create( "prop_physics" )
                inflictor1:Spawn()
                state.inflictor1 = inflictor1

                local inflictor2 = ents.Create( "prop_physics" )
                inflictor2:Spawn()
                state.inflictor2 = inflictor2

                state.dmgInfo:SetInflictor( inflictor1 )
                state.dmgInfo:SetInflictor( inflictor2 )

                expect( state.dmgInfo:GetInflictor() ).to.equal( inflictor2 )
            end,
            cleanup = function( state )
                if IsValid( state.inflictor1 ) then SafeRemoveEntity( state.inflictor1 ) end
                if IsValid( state.inflictor2 ) then SafeRemoveEntity( state.inflictor2 ) end
            end
        },

        {
            name = "Does not affect GetAttacker",
            func = function( state )
                local initialAttacker = state.dmgInfo:GetAttacker() -- Should be NULL / invalid
                local inflictorToSet = ents.Create( "prop_physics" )
                inflictorToSet:Spawn()
                state.inflictorToSet = inflictorToSet

                state.dmgInfo:SetInflictor( inflictorToSet )

                local finalAttacker = state.dmgInfo:GetAttacker()
                local finalInflictor = state.dmgInfo:GetInflictor()

                expect( finalInflictor ).to.equal( inflictorToSet )
                expect( finalAttacker ).to.equal( initialAttacker )
                expect( finalAttacker ).to.beInvalid()
            end,
            cleanup = function( state )
                if IsValid( state.inflictorToSet ) then SafeRemoveEntity( state.inflictorToSet ) end
            end
        },

        {
            name = "Errors when given a non-Entity argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetInflictor( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetInflictor' (Entity expected, got number)]] )
            end
        },
        {
            name = "Errors when given a non-Entity argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetInflictor( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetInflictor' (Entity expected, got string)]] )
            end
        },
        {
            name = "Errors when given a non-Entity argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetInflictor( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetInflictor' (Entity expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetInflictor() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetInflictor' (Entity expected, got no value)]] )
            end
        },

        {
            name = "Errors when given NULL",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetInflictor( NULL ) end
                expect( testFunc ).to.errWith( [[Tried to use a NULL entity!]] )
            end
        }
    }
}

