return {
    groupName = "CTakeDamageInfo:GetDamageCustom",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamageCustom ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local custom = state.dmgInfo:GetDamageCustom()
                expect( custom ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 by default",
            func = function( state )
                local custom = state.dmgInfo:GetDamageCustom()
                expect( custom ).to.equal( 0 )
            end
        },

        {
            name = "Returns the value set by SetDamageCustom",
            func = function( state )
                local expectedCustom = 42
                state.dmgInfo:SetDamageCustom( expectedCustom )
                local actualCustom = state.dmgInfo:GetDamageCustom()
                expect( actualCustom ).to.equal( expectedCustom )
            end
        },
    }
}

