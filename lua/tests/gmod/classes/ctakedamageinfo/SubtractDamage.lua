return {
    groupName = "CTakeDamageInfo:SubtractDamage",

    beforeEach = function( state )
        state.initialDamage = 50

        state.dmgInfo = DamageInfo()
        state.dmgInfo:SetDamage( state.initialDamage )
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SubtractDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local result = state.dmgInfo:SubtractDamage( 10 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Subtracts damage correctly (positive number)",
            func = function( state )
                local subtractAmount = 20

                state.dmgInfo:SubtractDamage( subtractAmount )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage - subtractAmount )
            end
        },

        {
            name = "Subtracts damage correctly (zero number)",
            func = function( state )
                local subtractAmount = 0

                state.dmgInfo:SubtractDamage( subtractAmount )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage - subtractAmount )
            end
        },

        {
            name = "Subtracts damage correctly (negative number - adds damage)",
            func = function( state )
                local subtractAmount = -10

                state.dmgInfo:SubtractDamage( subtractAmount )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage - subtractAmount )
            end
        },

        {
            name = "Subtracts damage correctly (numeric string)",
            func = function( state )
                local subtractAmount = 20

                state.dmgInfo:SubtractDamage( tostring( subtractAmount ) )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage - subtractAmount )
            end
        },

        {
            name = "Goes negative when subtracting more than current damage (number)",
            func = function( state )
                local subtractAmount = 20

                state.dmgInfo:SetDamage( state.initialDamage )
                state.dmgInfo:SubtractDamage( subtractAmount )

                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage - subtractAmount )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SubtractDamage( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SubtractDamage' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SubtractDamage( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SubtractDamage' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SubtractDamage() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SubtractDamage' (number expected, got no value)]] )
            end
        }
    }
}

