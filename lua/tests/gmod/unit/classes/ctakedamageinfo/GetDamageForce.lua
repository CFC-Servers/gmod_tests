return {
    groupName = "CTakeDamageInfo:GetDamageForce",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamageForce ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Vector object",
            func = function( state )
                local force = state.dmgInfo:GetDamageForce()
                expect( force ).to.beA( "Vector" )
            end
        },

        {
            name = "Returns Vector(0, 0, 0) by default",
            func = function( state )
                local force = state.dmgInfo:GetDamageForce()
                expect( force ).to.equal( Vector( 0, 0, 0 ) )
            end
        },

        {
            name = "Returns the vector set by SetDamageForce",
            func = function( state )
                local expectedForce = Vector( 10, -20, 30.5 )
                state.dmgInfo:SetDamageForce( expectedForce )

                local actualForce = state.dmgInfo:GetDamageForce()
                expect( actualForce ).to.equal( expectedForce )
            end
        }
    }
}

