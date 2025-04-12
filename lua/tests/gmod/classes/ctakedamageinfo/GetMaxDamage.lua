return {
    groupName = "CTakeDamageInfo:GetMaxDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetMaxDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local maxDmg = state.dmgInfo:GetMaxDamage()
                expect( maxDmg ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 by default",
            func = function( state )
                local maxDmg = state.dmgInfo:GetMaxDamage()
                expect( maxDmg ).to.equal( 0 )
            end
        },

        {
            name = "Returns the positive value set by SetMaxDamage",
            func = function( state )
                local expectedMax = 500
                state.dmgInfo:SetMaxDamage( expectedMax )
                local actualMax = state.dmgInfo:GetMaxDamage()
                expect( actualMax ).to.equal( expectedMax )
            end
        },

        {
            name = "Returns the negative value set by SetMaxDamage",
            func = function( state )
                local expectedMax = -1
                state.dmgInfo:SetMaxDamage( expectedMax )
                local actualMax = state.dmgInfo:GetMaxDamage()
                expect( actualMax ).to.equal( expectedMax )
            end
        },
    }
}

