return {
    groupName = "CTakeDamageInfo:GetInflictor",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetInflictor ).to.beA( "function" )
            end
        },

        {
            name = "Returns an invalid entity by default",
            func = function( state )
                local inf = state.dmgInfo:GetInflictor()
                expect( inf ).to.beInvalid()
            end
        },

        {
            name = "Returns an Entity object when a valid inflictor is set",
            func = function( state )
                local expectedInf = ents.Create( "prop_physics" )
                expectedInf:Spawn()
                state.expectedInf = expectedInf

                state.dmgInfo:SetInflictor( expectedInf )
                local actualInf = state.dmgInfo:GetInflictor()
                expect( actualInf ).to.beA( "Entity" )
            end,
            cleanup = function( state )
                if IsValid( state.expectedInf ) then SafeRemoveEntity( state.expectedInf ) end
            end
        },

        {
            name = "Returns the weapon entity set by SetInflictor",
            func = function( state )
                local expectedInf = ents.Create( "weapon_pistol" )
                expectedInf:Spawn()
                state.expectedInf = expectedInf

                state.dmgInfo:SetInflictor( expectedInf )
                local actualInf = state.dmgInfo:GetInflictor()
                expect( actualInf ).to.equal( expectedInf )
            end,
            cleanup = function( state )
                if IsValid( state.expectedInf ) then SafeRemoveEntity( state.expectedInf ) end
            end
        },

        {
            name = "Returns the non-weapon entity set by SetInflictor",
            func = function( state )
                local expectedInf = ents.Create( "prop_physics" )
                expectedInf:Spawn()
                state.expectedInf = expectedInf

                state.dmgInfo:SetInflictor( expectedInf )
                local actualInf = state.dmgInfo:GetInflictor()
                expect( actualInf ).to.equal( expectedInf )
            end,
            cleanup = function( state )
                if IsValid( state.expectedInf ) then SafeRemoveEntity( state.expectedInf ) end
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

