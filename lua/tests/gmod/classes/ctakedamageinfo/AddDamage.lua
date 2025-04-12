return {
    groupName = "CTakeDamageInfo:AddDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
        state.dmgInfo:SetDamage( 10 )
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.AddDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local result = state.dmgInfo:AddDamage( 5 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Increases damage correctly with a positive number",
            func = function( state )
                local initialDamage = state.dmgInfo:GetDamage()
                local increase = 5

                state.dmgInfo:AddDamage( increase )
                local finalDamage = state.dmgInfo:GetDamage()

                expect( finalDamage ).to.equal( initialDamage + increase )
            end
        },

        {
            name = "Does not change damage when adding zero",
            func = function( state )
                local initialDamage = state.dmgInfo:GetDamage()

                state.dmgInfo:AddDamage( 0 )
                local finalDamage = state.dmgInfo:GetDamage()

                expect( finalDamage ).to.equal( initialDamage )
            end
        },

        {
            name = "Decreases damage correctly when adding a negative number",
            func = function( state )
                local initialDamage = state.dmgInfo:GetDamage()
                local decrease = -5

                state.dmgInfo:AddDamage( decrease )
                local finalDamage = state.dmgInfo:GetDamage()

                expect( finalDamage ).to.equal( initialDamage + decrease )
            end
        },

        {
            name = "Increases damage correctly when given a numeric string",
            func = function( state )
                local initialDamage = state.dmgInfo:GetDamage()
                local increase = 5

                state.dmgInfo:AddDamage( tostring( increase ) )
                local finalDamage = state.dmgInfo:GetDamage()

                expect( finalDamage ).to.equal( initialDamage + increase )
            end
        },

        {
            name = "Errors when given a non-numeric string",
            func = function( state )
                local testFunc = function() state.dmgInfo:AddDamage( "this is not a number" ) end
                expect( testFunc ).to.errWith( "bad argument #1 to 'AddDamage' (number expected, got string)" )
            end
        },
        {
            name = "Errors when given a non-numeric argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:AddDamage( {} ) end
                expect( testFunc ).to.errWith( "bad argument #1 to 'AddDamage' (number expected, got table)" )
            end
        },
        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:AddDamage() end
                expect( testFunc ).to.errWith( "bad argument #1 to 'AddDamage' (number expected, got no value)" )
            end
        }
    }
}

