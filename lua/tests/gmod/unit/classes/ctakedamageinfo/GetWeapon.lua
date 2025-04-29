return {
    groupName = "CTakeDamageInfo:GetWeapon",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetWeapon ).to.beA( "function" )
            end
        },

        {
            name = "Returns an invalid entity by default",
            func = function( state )
                local wep = state.dmgInfo:GetWeapon()
                expect( wep ).to.beInvalid()
            end
        },

        {
            name = "Returns an Entity object when a valid weapon is set",
            func = function( state )
                local expectedWep = ents.Create( "weapon_pistol" )
                expectedWep:Spawn()
                state.expectedWep = expectedWep

                state.dmgInfo:SetWeapon( expectedWep )
                local actualWep = state.dmgInfo:GetWeapon()
                expect( actualWep ).to.beA( "Weapon" )
            end,
            cleanup = function( state )
                if IsValid( state.expectedWep ) then
                    SafeRemoveEntity( state.expectedWep )
                end
            end
        },

        {
            name = "Returns the weapon entity set by SetWeapon (weapon_pistol)",
            func = function( state )
                local expectedWep = ents.Create( "weapon_pistol" )
                expectedWep:Spawn()
                state.expectedWep = expectedWep

                state.dmgInfo:SetWeapon( expectedWep )
                local actualWep = state.dmgInfo:GetWeapon()
                expect( actualWep ).to.equal( expectedWep )
            end,
            cleanup = function( state )
                if IsValid( state.expectedWep ) then
                    SafeRemoveEntity( state.expectedWep )
                end
            end
        },

        {
            name = "Returns a non-weapon entity set by SetWeapon (prop_physics)",
            func = function( state )
                local expectedEnt = ents.Create( "prop_physics" )
                expectedEnt:Spawn()
                state.expectedEnt = expectedEnt

                state.dmgInfo:SetWeapon( expectedEnt )
                local actualEnt = state.dmgInfo:GetWeapon()
                expect( actualEnt ).to.equal( expectedEnt )
            end,
            cleanup = function( state )
                if IsValid( state.expectedEnt ) then
                    SafeRemoveEntity( state.expectedEnt )
                end
            end
        },

        {
            name = "Errors if setting a NULL Entity",
            func = function( state )
                local func = function() state.dmgInfo:SetWeapon( NULL ) end
                expect( func ).to.errWith( [[Tried to use a NULL entity!]] )
            end
        }
    }
}

