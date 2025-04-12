return {
    groupName = "CTakeDamageInfo:SetMaxDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetMaxDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetMaxDamage( 100 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets max damage correctly (positive number)",
            func = function( state )
                local expectedMax = 500

                state.dmgInfo:SetMaxDamage( expectedMax )
                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Sets max damage correctly (zero number)",
            func = function( state )
                state.dmgInfo:SetMaxDamage( 100 )

                local expectedMax = 0
                state.dmgInfo:SetMaxDamage( expectedMax )

                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Sets max damage correctly (negative number)",
            func = function( state )
                local expectedMax = -1

                state.dmgInfo:SetMaxDamage( expectedMax )
                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Sets max damage correctly (positive numeric string)",
            func = function( state )
                local expectedMax = 750

                state.dmgInfo:SetMaxDamage( tostring( expectedMax ) )
                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Sets max damage correctly (zero numeric string)",
            func = function( state )
                state.dmgInfo:SetMaxDamage( 100 )

                local expectedMax = 0
                state.dmgInfo:SetMaxDamage( tostring( expectedMax ) )

                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Sets max damage correctly (negative numeric string)",
            func = function( state )
                local expectedMax = -1

                state.dmgInfo:SetMaxDamage( tostring( expectedMax ) )
                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Overwrites previously set max damage",
            func = function( state )
                state.dmgInfo:SetMaxDamage( 100 )

                local expectedMax = 250
                state.dmgInfo:SetMaxDamage( expectedMax )

                expect( state.dmgInfo:GetMaxDamage() ).to.equal( expectedMax )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetMaxDamage( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetMaxDamage' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetMaxDamage( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetMaxDamage' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetMaxDamage() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetMaxDamage' (number expected, got no value)]] )
            end
        }
    }
}

