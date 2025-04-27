return WithBotTestTools( {
    groupName = "CUserCmd:GetMouseY",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetMouseY ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set MouseY value",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseY", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearButtons()
                    expect( cmd:GetMouseY() ).to.equal( 0 )

                    cmd:SetMouseY( 100 )
                    expect( cmd:GetMouseY() ).to.equal( 100 )

                    done()
                end )
            end
        },

        {
            name = "Returns 0 when set to math.huge",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseY", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearButtons()
                    expect( cmd:GetMouseY() ).to.equal( 0 )

                    cmd:SetMouseY( math.huge )
                    expect( cmd:GetMouseY() ).to.equal( 0 )

                    done()
                end )
            end
        },

        {
            name = "Returns the correct value when set to negative values",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetMouseY", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearButtons()
                    expect( cmd:GetMouseY() ).to.equal( 0 )

                    cmd:SetMouseY( -100 )
                    expect( cmd:GetMouseY() ).to.equal( -100 )

                    done()
                end )
            end
        }
    }
} )
