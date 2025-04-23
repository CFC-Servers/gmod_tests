return WithBotTestTools( {
    groupName = "CUserCmd:CommandNumber",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.CommandNumber ).to.beA( "function" )
            end
        },

        {
            name = "Returns an ever-increasing number",
            async = true,
            timeout = 0.25,
            func = function( state )
                local bot = state.addBot()

                local last = 0
                local iterations = 0

                hook.Add( "StartCommand", "CUserCmd:ClearMovement", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        local number = cmd:CommandNumber()
                        expect( number ).to.beA( "number" )
                        expect( number ).to.beGreaterThan( last )

                        last = number
                        iterations = iterations + 1

                        if iterations == 4 then done() end
                    end )
                end )
            end
        }
    }
} )
