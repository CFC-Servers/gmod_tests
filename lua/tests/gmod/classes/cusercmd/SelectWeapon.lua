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

        -- FIXME: how tf do we make this work
        {
            name = "Selects the given weapon",
            async = true,
            coroutine = true,
            when = "We can figure out how to make this work..." == false,
            timeout = 5,
            func = function( state )
                --- @type Player
                local bot = state.addBot()

                WaitForTicks( 10 )

                local crowbar = bot:Give( "weapon_crowbar" )
                local magnum = bot:Give( "weapon_357" )

                WaitForTicks( 10 )

                hook.Add( "StartCommand", "CUserCmd:SelectWeapon", function( ply, cmd )
                    if ply ~= bot then return end

                    local success = ProtectedCall( function()
                        cmd:SelectWeapon( magnum )
                        expect( bot:GetActiveWeapon():GetClass() ).to.equal( "weapon_357" )

                        cmd:SelectWeapon( crowbar )
                        expect( bot:GetActiveWeapon():GetClass() ).to.equal( "weapon_crowbar" )

                        done()
                    end )
                    if not success then fail() end

                end )
            end
        },

    }
} )
