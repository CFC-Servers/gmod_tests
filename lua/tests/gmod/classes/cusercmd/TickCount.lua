return WithBotTestTools( {
    groupName = "CUserCmd:TickCount",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.TickCount ).to.beA( "function" )
            end
        },

        {
            name = "Always returns 0 for bots",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                local iter = 0
                hook.Add( "StartCommand", "CUserCmd:TickCount", function( ply, cmd )
                    if ply ~= bot then return end

                    expect( cmd:TickCount() ).to.equal( 0 )

                    iter = iter + 1
                    if iter == 6 then
                        done()
                        return
                    end
                end )
            end
        },

        -- TODO: Somehow test the behavior for not-bots?
    }
} )
