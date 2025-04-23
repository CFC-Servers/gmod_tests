return WithBotTestTools( {
    groupName = "CUserCmd:GetSideMove",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetSideMove ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set SideMove",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetSideMove", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearMovement()
                        expect( cmd:GetSideMove() ).to.equal( 0 )

                        cmd:SetSideMove( 100 )
                        expect( cmd:GetSideMove() ).to.equal( 100 )

                        done()
                    end )
                end )
            end
        },

        {
            name = "Returns the correct value when set to math.huge",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetSideMove", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearMovement()
                        expect( cmd:GetSideMove() ).to.equal( 0 )

                        cmd:SetSideMove( math.huge )
                        expect( cmd:GetSideMove() ).to.equal( math.huge )

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

                hook.Add( "StartCommand", "CUserCmd:GetSideMove", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:ClearMovement()
                        expect( cmd:GetSideMove() ).to.equal( 0 )

                        cmd:SetSideMove( -100 )
                        expect( cmd:GetSideMove() ).to.equal( -100 )

                        done()
                    end )
                end )
            end
        }
    }
} )
