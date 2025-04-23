return WithBotTestTools( {
    groupName = "CUserCmd:IsForced",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.IsForced ).to.beA( "function" )
            end
        },

        {
            name = "Returns false under normal conditions",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:IsForced", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:IsForced() ).to.beFalse()
                        done()
                    end )
                end )
            end
        },

        -- TODO: Find a way to simulate a situation where it would return true
    }
} )
