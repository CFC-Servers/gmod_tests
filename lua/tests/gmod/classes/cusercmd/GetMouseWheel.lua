return WithBotTestTools( {
    groupName = "CUserCmd:GetMouseWheel",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetMouseWheel ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set MouseWheel value",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseWheel", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearButtons()
                        expect( cmd:GetMouseWheel() ).to.equal( 0 )

                        cmd:SetMouseWheel( 100 )
                        expect( cmd:GetMouseWheel() ).to.equal( 100 )

                        done()
                    end )
                end )
            end
        },

        {
            name = "Returns 0 when set to math.huge",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseWheel", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearButtons()
                        expect( cmd:GetMouseWheel() ).to.equal( 0 )

                        cmd:SetMouseWheel( math.huge )
                        expect( cmd:GetMouseWheel() ).to.equal( 0 )

                        done()
                    end )
                end )
            end
        },

        {
            name = "Returns the correct value when set to negative values",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseWheel", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearButtons()
                        expect( cmd:GetMouseWheel() ).to.equal( 0 )

                        cmd:SetMouseWheel( -100 )
                        expect( cmd:GetMouseWheel() ).to.equal( -100 )

                        done()
                    end )
                end )
            end
        }
    }
} )
