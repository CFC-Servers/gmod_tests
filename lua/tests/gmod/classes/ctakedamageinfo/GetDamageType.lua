return {
    groupName = "CTakeDamageInfo:GetDamageType",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamageType ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local dmgType = state.dmgInfo:GetDamageType()
                expect( dmgType ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 (DMG_GENERIC) by default",
            func = function( state )
                local dmgType = state.dmgInfo:GetDamageType()
                expect( dmgType ).to.equal( 0 )
            end
        },

        {
            name = "Returns the value set by SetDamageType (single flag)",
            func = function( state )
                local expectedType = DMG_BULLET
                state.dmgInfo:SetDamageType( expectedType )

                local actualType = state.dmgInfo:GetDamageType()
                expect( actualType ).to.equal( expectedType )
            end
        },

        {
            name = "Returns the value set by SetDamageType (multiple flags)",
            func = function( state )
                local expectedType = DMG_BLAST + DMG_CLUB
                state.dmgInfo:SetDamageType( expectedType )

                local actualType = state.dmgInfo:GetDamageType()
                expect( actualType ).to.equal( expectedType )
            end
        }
    }
}

