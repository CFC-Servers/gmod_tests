return WithBotTestTools( {
    groupName = "CUserCmd:ClearMovement",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.ClearMovement ).to.beA( "function" )
            end
        },

        {
            name = "Removes all movement from the command",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:ClearMovement", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:SetForwardMove( 100 )
                    cmd:SetSideMove( 100 )
                    cmd:SetUpMove( 100 )

                    expect( cmd:GetForwardMove() ).to.equal( 100 )
                    expect( cmd:GetSideMove() ).to.equal( 100 )
                    expect( cmd:GetUpMove() ).to.equal( 100 )

                    cmd:ClearMovement()

                    expect( cmd:GetForwardMove() ).to.equal( 0 )
                    expect( cmd:GetSideMove() ).to.equal( 0 )
                    expect( cmd:GetUpMove() ).to.equal( 0 )

                    done()
                end )
            end
        },

        {
            name = "Removes all negative movement from the command",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:ClearMovement", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:SetForwardMove( -100 )
                    cmd:SetSideMove( -100 )
                    cmd:SetUpMove( -100 )

                    expect( cmd:GetForwardMove() ).to.equal( -100 )
                    expect( cmd:GetSideMove() ).to.equal( -100 )
                    expect( cmd:GetUpMove() ).to.equal( -100 )

                    cmd:ClearMovement()

                    expect( cmd:GetForwardMove() ).to.equal( 0 )
                    expect( cmd:GetSideMove() ).to.equal( 0 )
                    expect( cmd:GetUpMove() ).to.equal( 0 )

                    done()
                end )
            end
        }
    }
} )
