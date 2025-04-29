return {
    groupName = "CTakeDamageInfo:GetDamageBonus",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamageBonus ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local bonus = state.dmgInfo:GetDamageBonus()
                expect( bonus ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 by default",
            func = function( state )
                local bonus = state.dmgInfo:GetDamageBonus()
                expect( bonus ).to.equal( 0 )
            end
        },

        {
            name = "Returns the value set by SetDamageBonus",
            func = function( state )
                local expectedBonus = 15
                state.dmgInfo:SetDamageBonus( expectedBonus )

                local actualBonus = state.dmgInfo:GetDamageBonus()
                expect( actualBonus ).to.equal( expectedBonus )
            end
        },

        {
            name = "Value is unaffected by SetDamage",
            func = function( state )
                local expectedBonus = 10
                state.dmgInfo:SetDamageBonus( expectedBonus )
                state.dmgInfo:SetDamage( 100 )

                local actualBonus = state.dmgInfo:GetDamageBonus()
                expect( actualBonus ).to.equal( expectedBonus )
            end
        },

        {
            name = "Value is unaffected by SetBaseDamage",
            func = function( state )
                local expectedBonus = 20
                state.dmgInfo:SetDamageBonus( expectedBonus )
                state.dmgInfo:SetBaseDamage( 200 )

                local actualBonus = state.dmgInfo:GetDamageBonus()
                expect( actualBonus ).to.equal( expectedBonus )
            end
        }
    }
}

