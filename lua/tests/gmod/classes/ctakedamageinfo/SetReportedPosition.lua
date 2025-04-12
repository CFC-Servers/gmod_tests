return {
    groupName = "CTakeDamageInfo:SetReportedPosition",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetReportedPosition ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetReportedPosition( Vector( 1, 1, 1 ) )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets reported position correctly (non-zero vector)",
            func = function( state )
                local expectedPos = Vector( 10, -20, 30.5 )

                state.dmgInfo:SetReportedPosition( expectedPos )
                expect( state.dmgInfo:GetReportedPosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Sets reported position correctly (zero vector)",
            func = function( state )
                state.dmgInfo:SetReportedPosition( Vector( 1, 1, 1 ) )

                local expectedPos = Vector( 0, 0, 0 )
                state.dmgInfo:SetReportedPosition( expectedPos )

                expect( state.dmgInfo:GetReportedPosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Overwrites previously set reported position",
            func = function( state )
                state.dmgInfo:SetReportedPosition( Vector( 1, 1, 1 ) )

                local expectedPos = Vector( 5, 5, 5 )
                state.dmgInfo:SetReportedPosition( expectedPos )

                expect( state.dmgInfo:GetReportedPosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Errors when given a non-Vector argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetReportedPosition( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetReportedPosition' (Vector expected, got number)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetReportedPosition( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetReportedPosition' (Vector expected, got string)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetReportedPosition( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetReportedPosition' (Vector expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetReportedPosition() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetReportedPosition' (Vector expected, got no value)]] )
            end
        }
    }
}

