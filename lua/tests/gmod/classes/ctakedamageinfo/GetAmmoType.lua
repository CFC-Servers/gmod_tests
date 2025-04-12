return {
    groupName = "CTakeDamageInfo:GetAmmoType",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetAmmoType ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local ammoType = state.dmgInfo:GetAmmoType()
                expect( ammoType ).to.beA( "number" )
            end
        },

        {
            name = "Returns -1 by default",
            func = function( state )
                local ammoType = state.dmgInfo:GetAmmoType()
                expect( ammoType ).to.equal( -1 )
            end
        },

        {
            name = "Returns the value set by SetAmmoType",
            func = function( state )
                local expectedAmmoType = 5
                state.dmgInfo:SetAmmoType( expectedAmmoType )

                local actualAmmoType = state.dmgInfo:GetAmmoType()
                expect( actualAmmoType ).to.equal( expectedAmmoType )
            end
        }
    }
}

