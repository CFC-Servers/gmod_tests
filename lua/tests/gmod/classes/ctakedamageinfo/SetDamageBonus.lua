return {
    groupName = "CTakeDamageInfo:SetDamageBonus",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetDamageBonus ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetDamageBonus( 10 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets bonus damage correctly (positive number)",
            func = function( state )
                local expectedBonus = 15

                state.dmgInfo:SetDamageBonus( expectedBonus )
                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Sets bonus damage correctly (zero number)",
            func = function( state )
                state.dmgInfo:SetDamageBonus( 10 )

                local expectedBonus = 0
                state.dmgInfo:SetDamageBonus( expectedBonus )

                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Sets bonus damage correctly (negative number)",
            func = function( state )
                local expectedBonus = -5

                state.dmgInfo:SetDamageBonus( expectedBonus )
                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Sets bonus damage correctly (positive numeric string)",
            func = function( state )
                local expectedBonus = 25

                state.dmgInfo:SetDamageBonus( tostring( expectedBonus ) )
                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Sets bonus damage correctly (zero numeric string)",
            func = function( state )
                state.dmgInfo:SetDamageBonus( 10 )

                local expectedBonus = 0
                state.dmgInfo:SetDamageBonus( tostring( expectedBonus ) )

                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Sets bonus damage correctly (negative numeric string)",
            func = function( state )
                local expectedBonus = -7

                state.dmgInfo:SetDamageBonus( tostring( expectedBonus ) )
                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Overwrites previously set bonus damage",
            func = function( state )
                state.dmgInfo:SetDamageBonus( 100 )

                local expectedBonus = 200
                state.dmgInfo:SetDamageBonus( expectedBonus )

                expect( state.dmgInfo:GetDamageBonus() ).to.equal( expectedBonus )
            end
        },

        {
            name = "Does not affect GetDamage or GetBaseDamage",
            func = function( state )
                local initialTotal = state.dmgInfo:GetDamage()
                local initialBase = state.dmgInfo:GetBaseDamage()
                local bonusToSet = 30

                state.dmgInfo:SetDamageBonus( bonusToSet )

                local finalTotal = state.dmgInfo:GetDamage()
                local finalBase = state.dmgInfo:GetBaseDamage()
                local finalBonus = state.dmgInfo:GetDamageBonus()

                expect( finalBonus ).to.equal( bonusToSet )
                expect( finalTotal ).to.equal( initialTotal )
                expect( finalBase ).to.equal( initialBase )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageBonus( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageBonus' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageBonus( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageBonus' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageBonus() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageBonus' (number expected, got no value)]] )
            end
        }
    }
}
