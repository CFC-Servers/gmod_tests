return {
    groupName = "CTakeDamageInfo:SetDamagePosition",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetDamagePosition ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetDamagePosition( Vector( 1, 1, 1 ) )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets damage position correctly (non-zero vector)",
            func = function( state )
                local expectedPos = Vector( 100, -200, 300.5 )

                state.dmgInfo:SetDamagePosition( expectedPos )
                expect( state.dmgInfo:GetDamagePosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Sets damage position correctly (zero vector)",
            func = function( state )
                state.dmgInfo:SetDamagePosition( Vector( 1, 1, 1 ) )

                local expectedPos = Vector( 0, 0, 0 )
                state.dmgInfo:SetDamagePosition( expectedPos )

                expect( state.dmgInfo:GetDamagePosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Overwrites previously set damage position",
            func = function( state )
                state.dmgInfo:SetDamagePosition( Vector( 1, 1, 1 ) )

                local expectedPos = Vector( 50, 50, 50 )
                state.dmgInfo:SetDamagePosition( expectedPos )

                expect( state.dmgInfo:GetDamagePosition() ).to.equal( expectedPos )
            end
        },

        {
            name = "Errors when given a non-Vector argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamagePosition( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamagePosition' (Vector expected, got number)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamagePosition( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamagePosition' (Vector expected, got string)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamagePosition( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamagePosition' (Vector expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamagePosition() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamagePosition' (Vector expected, got no value)]] )
            end
        }
    }
}

