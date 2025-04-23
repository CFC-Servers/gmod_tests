return WithBotTestTools( {
    groupName = "CUserCmd:GetUpMove",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetUpMove ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set UpMove",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetUpMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetUpMove() ).to.equal( 0 )

                    cmd:SetUpMove( 100 )
                    expect( cmd:GetUpMove() ).to.equal( 100 )

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

                hook.Add( "StartCommand", "CUserCmd:GetUpMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetUpMove() ).to.equal( 0 )

                    cmd:SetUpMove( math.huge )
                    expect( cmd:GetUpMove() ).to.equal( math.huge )

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

                hook.Add( "StartCommand", "CUserCmd:GetUpMove", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:ClearMovement()
                    expect( cmd:GetUpMove() ).to.equal( 0 )

                    cmd:SetUpMove( -100 )
                    expect( cmd:GetUpMove() ).to.equal( -100 )

                    done()
                end )
            end
        }
    }
} )
