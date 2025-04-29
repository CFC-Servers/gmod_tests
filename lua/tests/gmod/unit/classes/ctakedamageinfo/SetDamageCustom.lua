return {
    groupName = "CTakeDamageInfo:SetDamageCustom",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )

                expect( meta.SetDamageCustom ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetDamageCustom( 10 )

                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets custom damage type correctly (positive number)",
            func = function( state )
                local expectedCustom = 42

                state.dmgInfo:SetDamageCustom( expectedCustom )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Sets custom damage type correctly (zero number)",
            func = function( state )
                state.dmgInfo:SetDamageCustom( 10 )

                local expectedCustom = 0
                state.dmgInfo:SetDamageCustom( expectedCustom )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Sets custom damage type correctly (negative number)",
            func = function( state )
                local expectedCustom = -99

                state.dmgInfo:SetDamageCustom( expectedCustom )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Sets custom damage type correctly (positive numeric string)",
            func = function( state )
                local expectedCustom = 88

                state.dmgInfo:SetDamageCustom( tostring( expectedCustom ) )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Sets custom damage type correctly (zero numeric string)",
            func = function( state )
                state.dmgInfo:SetDamageCustom( 10 )

                local expectedCustom = 0
                state.dmgInfo:SetDamageCustom( tostring( expectedCustom ) )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Sets custom damage type correctly (negative numeric string)",
            func = function( state )
                local expectedCustom = -77

                state.dmgInfo:SetDamageCustom( tostring( expectedCustom ) )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Overwrites previously set custom damage type",
            func = function( state )
                state.dmgInfo:SetDamageCustom( 100 )

                local expectedCustom = 200
                state.dmgInfo:SetDamageCustom( expectedCustom )

                expect( state.dmgInfo:GetDamageCustom() ).to.equal( expectedCustom )
            end
        },

        {
            name = "Does not affect GetDamage or GetBaseDamage",
            func = function( state )
                local initialTotal = state.dmgInfo:GetDamage()
                local initialBase = state.dmgInfo:GetBaseDamage()
                local customToSet = 30

                state.dmgInfo:SetDamageCustom( customToSet )

                local finalTotal = state.dmgInfo:GetDamage()
                local finalBase = state.dmgInfo:GetBaseDamage()
                local finalCustom = state.dmgInfo:GetDamageCustom()

                expect( finalCustom ).to.equal( customToSet )
                expect( finalTotal ).to.equal( initialTotal )
                expect( finalBase ).to.equal( initialBase )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageCustom( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageCustom' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageCustom( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageCustom' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageCustom() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageCustom' (number expected, got no value)]] )
            end
        }
    }
}

