return WithBotTestTools( {
    groupName = "CUserCmd:GetForwardMove",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetForwardMove ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set ForwardMove",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetForwardMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetForwardMove() ).to.equal( 0 )

                    cmd:SetForwardMove( 100 )
                    expect( cmd:GetForwardMove() ).to.equal( 100 )

                    done()
                end )
            end
        },

        {
            name = "Returns the correct value when set to math.huge",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetForwardMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetForwardMove() ).to.equal( 0 )

                    cmd:SetForwardMove( math.huge )
                    expect( cmd:GetForwardMove() ).to.equal( math.huge )

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

                hook.Add( "StartCommand", "CUserCmd:GetForwardMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetForwardMove() ).to.equal( 0 )

                    cmd:SetForwardMove( -100 )
                    expect( cmd:GetForwardMove() ).to.equal( -100 )

                    done()
                end )
            end
        }
    }
} )
