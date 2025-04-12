return {
    groupName = "CTakeDamageInfo:SetDamageForce",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetDamageForce ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local result = state.dmgInfo:SetDamageForce( Vector( 1, 1, 1 ) )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets damage force correctly (non-zero vector)",
            func = function( state )
                local expectedForce = Vector( 10, -20, 30.5 )

                state.dmgInfo:SetDamageForce( expectedForce )
                expect( state.dmgInfo:GetDamageForce() ).to.equal( expectedForce )
            end
        },

        {
            name = "Sets damage force correctly (zero vector)",
            func = function( state )
                state.dmgInfo:SetDamageForce( Vector( 1, 1, 1 ) )

                local expectedForce = Vector( 0, 0, 0 )
                state.dmgInfo:SetDamageForce( expectedForce )

                expect( state.dmgInfo:GetDamageForce() ).to.equal( expectedForce )
            end
        },

        {
            name = "Overwrites previously set damage force",
            func = function( state )
                state.dmgInfo:SetDamageForce( Vector( 1, 1, 1 ) )

                local expectedForce = Vector( 5, 5, 5 )
                state.dmgInfo:SetDamageForce( expectedForce )

                expect( state.dmgInfo:GetDamageForce() ).to.equal( expectedForce )
            end
        },

        {
            name = "Errors when given a non-Vector argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageForce( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageForce' (Vector expected, got number)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageForce( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageForce' (Vector expected, got string)]] )
            end
        },
        {
            name = "Errors when given a non-Vector argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageForce( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageForce' (Vector expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageForce() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageForce' (Vector expected, got no value)]] )
            end
        }
    }
}

