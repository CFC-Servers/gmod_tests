return {
    groupName = "CTakeDamageInfo:SetDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetDamage( 10 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets damage correctly (positive number)",
            func = function( state )
                local expectedDamage = 50

                state.dmgInfo:SetDamage( expectedDamage )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Sets damage correctly (zero number)",
            func = function( state )
                state.dmgInfo:SetDamage( 10 )

                local expectedDamage = 0
                state.dmgInfo:SetDamage( expectedDamage )

                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Sets damage correctly (negative number)",
            func = function( state )
                local expectedDamage = -10

                state.dmgInfo:SetDamage( expectedDamage )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Sets damage correctly (positive numeric string)",
            func = function( state )
                local expectedDamage = 75

                state.dmgInfo:SetDamage( tostring( expectedDamage ) )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Sets damage correctly (zero numeric string)",
            func = function( state )
                state.dmgInfo:SetDamage( 10 )

                local expectedDamage = 0
                state.dmgInfo:SetDamage( tostring( expectedDamage ) )

                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Sets damage correctly (negative numeric string)",
            func = function( state )
                local expectedDamage = -20

                state.dmgInfo:SetDamage( tostring( expectedDamage ) )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Overwrites previously set damage",
            func = function( state )
                state.dmgInfo:SetDamage( 100 )

                local expectedDamage = 200
                state.dmgInfo:SetDamage( expectedDamage )

                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamage( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamage' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamage( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamage' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamage() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamage' (number expected, got no value)]] )
            end
        }
    }
}
