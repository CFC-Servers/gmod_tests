
return WithBotTestTools( {
    groupName = "CUserCmd:GetImpulse",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetImpulse ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set Impulse",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetImpulse", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:GetImpulse() ).to.equal( 0 )

                        cmd:SetImpulse( 101 )
                        expect( cmd:GetImpulse() ).to.equal( 101 )

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

                hook.Add( "StartCommand", "CUserCmd:GetImpulse", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:GetImpulse() ).to.equal( 0 )

                        cmd:SetImpulse( math.huge )
                        expect( cmd:GetImpulse() ).to.equal( 0 )

                        done()
                    end )
                end )
            end
        },

        -- TODO: Explain this functionality
        {
            name = "Returns the correct? value when set to negative values",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetImpulse", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:GetImpulse() ).to.equal( 0 )

                        cmd:SetImpulse( -100 )
                        expect( cmd:GetImpulse() ).to.equal( 156 )

                        cmd:SetImpulse( -1000 )
                        expect( cmd:GetImpulse() ).to.equal( 24 )

                        cmd:SetImpulse( -9999 )
                        expect( cmd:GetImpulse() ).to.equal( 241 )

                        done()
                    end )
                end )
            end
        }
    }
} )
