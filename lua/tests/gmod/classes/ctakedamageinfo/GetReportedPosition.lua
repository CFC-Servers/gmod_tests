return {
    groupName = "CTakeDamageInfo:GetReportedPosition",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetReportedPosition ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Vector object",
            func = function( state )
                local pos = state.dmgInfo:GetReportedPosition()
                expect( pos ).to.beA( "Vector" )
            end
        },

        {
            name = "Returns Vector(0, 0, 0) by default",
            func = function( state )
                local pos = state.dmgInfo:GetReportedPosition()
                expect( pos ).to.equal( Vector( 0, 0, 0 ) )
            end
        },

        {
            name = "Returns the vector set by SetReportedPosition",
            func = function( state )
                local expectedPos = Vector( 50, -150, 250.25 )
                state.dmgInfo:SetReportedPosition( expectedPos )
                local actualPos = state.dmgInfo:GetReportedPosition()
                expect( actualPos ).to.equal( expectedPos )
            end
        },

        {
            name = "Value is unaffected by SetDamagePosition",
            func = function( state )
                local expectedReportedPos = Vector( 1, 2, 3 )
                local differentDamagePos = Vector( 10, 20, 30 )

                state.dmgInfo:SetReportedPosition( expectedReportedPos )
                state.dmgInfo:SetDamagePosition( differentDamagePos )

                local actualReportedPos = state.dmgInfo:GetReportedPosition()
                expect( actualReportedPos ).to.equal( expectedReportedPos )
            end
        }
    }
}

