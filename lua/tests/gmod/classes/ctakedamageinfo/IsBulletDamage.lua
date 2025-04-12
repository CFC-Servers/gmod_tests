return {
    groupName = "CTakeDamageInfo:IsBulletDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.IsBulletDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns a boolean",
            func = function( state )
                local result = state.dmgInfo:IsBulletDamage()
                expect( result ).to.beA( "boolean" )
            end
        },

        {
            name = "Returns false by default (DMG_GENERIC)",
            func = function( state )
                expect( state.dmgInfo:GetDamageType() ).to.equal( 0 )

                local result = state.dmgInfo:IsBulletDamage()
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns false when damage type does not include DMG_BULLET",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BLAST )

                local result = state.dmgInfo:IsBulletDamage()
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns true when damage type is exactly DMG_BULLET",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsBulletDamage()
                expect( result ).to.beTrue()
            end
        },

        {
            name = "Returns true when damage type includes DMG_BULLET among others",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET + DMG_SLASH )

                local result = state.dmgInfo:IsBulletDamage()
                expect( result ).to.beTrue()
            end
        }
    }
}

