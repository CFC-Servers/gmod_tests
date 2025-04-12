return {
    groupName = "CTakeDamageInfo:SetWeapon",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetWeapon ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local dummyEnt = ents.Create( "weapon_pistol" )
                dummyEnt:Spawn()
                state.dummyEnt = dummyEnt

                local result = state.dmgInfo:SetWeapon( dummyEnt )
                expect( result ).to.beNil()
            end,
            cleanup = function( state )
                if IsValid( state.dummyEnt ) then SafeRemoveEntity( state.dummyEnt ) end
            end
        },

        {
            name = "Sets weapon correctly",
            func = function( state )
                local expectedWeapon = ents.Create( "weapon_pistol" )
                expectedWeapon:Spawn()
                state.expectedWeapon = expectedWeapon

                state.dmgInfo:SetWeapon( expectedWeapon )
                expect( state.dmgInfo:GetWeapon() ).to.equal( expectedWeapon )
            end,
            cleanup = function( state )
                if IsValid( state.expectedWeapon ) then SafeRemoveEntity( state.expectedWeapon ) end
            end
        },

        {
            name = "Sets weapon correctly",
            func = function( state )
                local expectedWeapon = ents.Create( "prop_physics" )
                expectedWeapon:Spawn()
                state.expectedWeapon = expectedWeapon

                state.dmgInfo:SetWeapon( expectedWeapon )
                expect( state.dmgInfo:GetWeapon() ).to.equal( expectedWeapon )
            end,
            cleanup = function( state )
                if IsValid( state.expectedWeapon ) then SafeRemoveEntity( state.expectedWeapon ) end
            end
        },

        {
            name = "Overwrites previously set weapon",
            func = function( state )
                local weapon1 = ents.Create( "weapon_pistol" )
                weapon1:Spawn()
                state.weapon1 = weapon1

                local weapon2 = ents.Create( "weapon_shotgun" )
                weapon2:Spawn()
                state.weapon2 = weapon2

                state.dmgInfo:SetWeapon( weapon1 )
                state.dmgInfo:SetWeapon( weapon2 )

                expect( state.dmgInfo:GetWeapon() ).to.equal( weapon2 )
            end,
            cleanup = function( state )
                if IsValid( state.weapon1 ) then SafeRemoveEntity( state.weapon1 ) end
                if IsValid( state.weapon2 ) then SafeRemoveEntity( state.weapon2 ) end
            end
        },

        -- TODO: The wiki says this should work?
        {
            name = "Errors when given NULL",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetWeapon( NULL ) end
                expect( testFunc ).to.errWith( [[Tried to use a NULL entity!]] )
            end
        },
        {
            name = "Errors when given a non-Entity argument (number)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetWeapon( 123 ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetWeapon' (Entity expected, got number)]] )
            end
        },
        {
            name = "Errors when given a non-Entity argument (string)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetWeapon( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetWeapon' (Entity expected, got string)]] )
            end
        },
        {
            name = "Errors when given a non-Entity argument (table)",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetWeapon( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetWeapon' (Entity expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetWeapon() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetWeapon' (Entity expected, got no value)]] )
            end
        }
    }
}

