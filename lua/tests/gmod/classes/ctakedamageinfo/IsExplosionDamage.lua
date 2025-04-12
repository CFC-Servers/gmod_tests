return {
    groupName = "CTakeDamageInfo:IsExplosionDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.IsExplosionDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns a boolean",
            func = function( state )
                local result = state.dmgInfo:IsExplosionDamage()
                expect( result ).to.beA( "boolean" )
            end
        },

        {
            name = "Returns false by default (DMG_GENERIC)",
            func = function( state )
                expect( state.dmgInfo:GetDamageType() ).to.equal( 0 )

                local result = state.dmgInfo:IsExplosionDamage()
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns false when damage type does not include DMG_BLAST",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsExplosionDamage()
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns true when damage type is exactly DMG_BLAST",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BLAST )

                local result = state.dmgInfo:IsExplosionDamage()
                expect( result ).to.beTrue()
            end
        },

        {
            name = "Returns true when damage type includes DMG_BLAST among others",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BLAST + DMG_CLUB )

                local result = state.dmgInfo:IsExplosionDamage()
                expect( result ).to.beTrue()
            end
        }
    }
}
