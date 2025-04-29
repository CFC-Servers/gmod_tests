return {
    groupName = "CTakeDamageInfo:SetBaseDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetBaseDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetBaseDamage( 10 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets base damage correctly (positive)",
            func = function( state )
                local expectedBase = 50

                state.dmgInfo:SetBaseDamage( expectedBase )
                expect( state.dmgInfo:GetBaseDamage() ).to.equal( expectedBase )
            end
        },

        {
            name = "Sets base damage correctly (zero)",
            func = function( state )
                state.dmgInfo:SetBaseDamage( 10 ) -- Set non-zero first
                local expectedBase = 0
                state.dmgInfo:SetBaseDamage( expectedBase )
                expect( state.dmgInfo:GetBaseDamage() ).to.equal( expectedBase )
            end
        },

        {
            name = "Sets base damage correctly (negative)",
            func = function( state )
                local expectedBase = -10
                state.dmgInfo:SetBaseDamage( expectedBase )
                expect( state.dmgInfo:GetBaseDamage() ).to.equal( expectedBase )
            end
        },

        {
            name = "Sets base damage correctly when given a numeric string",
            func = function( state )
                local expectedBase = 10
                state.dmgInfo:SetBaseDamage( tostring( expectedBase ) )
                expect( state.dmgInfo:GetBaseDamage() ).to.equal( expectedBase )
            end
        },

        {
            name = "Overwrites previously set base damage",
            func = function( state )
                state.dmgInfo:SetBaseDamage( 100 )
                local expectedBase = 200
                state.dmgInfo:SetBaseDamage( expectedBase )
                expect( state.dmgInfo:GetBaseDamage() ).to.equal( expectedBase )
            end
        },

        {
            name = "Does not affect the value returned by GetDamage",
            func = function( state )
                local initialTotalDamage = state.dmgInfo:GetDamage()
                local baseToSet = 75

                state.dmgInfo:SetBaseDamage( baseToSet )

                local finalTotalDamage = state.dmgInfo:GetDamage()
                local finalBaseDamage = state.dmgInfo:GetBaseDamage()

                expect( finalBaseDamage ).to.equal( baseToSet )
                expect( finalTotalDamage ).to.equal( initialTotalDamage )
            end
        },

        {
            name = "Errors when given a non-numeric string",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetBaseDamage( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetBaseDamage' (number expected, got string)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetBaseDamage() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetBaseDamage' (number expected, got no value)]] )
            end
        }
    }
}

