return {
    groupName = "CTakeDamageInfo:GetDamagePosition",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamagePosition ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Vector object",
            func = function( state )
                local pos = state.dmgInfo:GetDamagePosition()
                expect( pos ).to.beA( "Vector" )
            end
        },

        {
            name = "Returns Vector(0, 0, 0) by default",
            func = function( state )
                local pos = state.dmgInfo:GetDamagePosition()
                expect( pos ).to.equal( Vector( 0, 0, 0 ) )
            end
        },

        {
            name = "Returns the vector set by SetDamagePosition",
            func = function( state )
                local expectedPos = Vector( 100, 200, -50.75 )
                state.dmgInfo:SetDamagePosition( expectedPos )
                local actualPos = state.dmgInfo:GetDamagePosition()
                expect( actualPos ).to.equal( expectedPos )
            end
        }
    }
}

