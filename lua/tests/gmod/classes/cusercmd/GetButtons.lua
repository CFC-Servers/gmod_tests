return WithBotTestTools( {
    groupName = "CUserCmd:GetButtons",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetButtons ).to.beA( "function" )
            end
        },

        {
            name = "Returns a bitflag of all keys pressed",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetButtons", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearButtons()
                        expect( cmd:GetButtons() ).to.equal( 0 )

                        cmd:AddKey( IN_FORWARD )
                        cmd:AddKey( IN_BACK )
                        expect( cmd:GetButtons() ).to.equal( IN_FORWARD + IN_BACK )

                        done()
                    end )
                end )
            end
        },

        {
            name = "Underflows when flag has math.huge",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetButtons", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearButtons()
                        expect( cmd:GetButtons() ).to.equal( 0 )

                        cmd:AddKey( math.huge )
                        expect( cmd:GetButtons() ).to.equal( -2147483648 )

                        cmd:AddKey( -math.huge )
                        expect( cmd:GetButtons() ).to.equal( -2147483648 )

                        done()
                    end )
                end )
            end
        }
    }
} )
