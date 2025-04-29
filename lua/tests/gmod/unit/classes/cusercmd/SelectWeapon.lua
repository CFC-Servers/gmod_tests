return WithBotTestTools( {
    groupName = "CUserCmd:SelectWeapon",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.SelectWeapon ).to.beA( "function" )
            end
        },

        {
            name = "Selects the given weapon",
            async = true,
            timeout = 0.5,
            func = function( state )
                --- @type Player
                local bot = state.addBot()
                bot:StripWeapons()

                local crowbar = bot:Give( "weapon_crowbar" )
                local magnum = bot:Give( "weapon_357" )

                local iter = 0
                hook.Add( "StartCommand", "CUserCmd:SelectWeapon", function( ply, cmd )
                    if ply ~= bot then return end

                    -- Needs about 1 tick after SelectWeapon is called
                    if iter == 0 then
                        cmd:SelectWeapon( magnum )
                    end

                    if iter == 1 then
                        expect( bot:GetActiveWeapon() ).to.equal( magnum )
                        cmd:SelectWeapon( crowbar )
                    end

                    if iter == 2 then
                        expect( bot:GetActiveWeapon() ).to.equal( crowbar )
                        done()
                    end

                    iter = iter + 1
                end )
            end
        },

    }
} )
