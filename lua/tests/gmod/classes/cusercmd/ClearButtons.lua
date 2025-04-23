return WithBotTestTools( {
    groupName = "CUserCmd:ClearButtons",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.ClearButtons ).to.beA( "function" )
            end
        },

        {
            name = "Removes all keys from the command",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:ClearButtons", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:AddKey( IN_FORWARD )
                        cmd:AddKey( IN_BACK )
                        cmd:AddKey( IN_MOVELEFT )
                        cmd:AddKey( IN_MOVERIGHT )
                        cmd:AddKey( IN_JUMP )
                        cmd:AddKey( IN_ATTACK )
                        cmd:AddKey( IN_ATTACK2 )
                        cmd:AddKey( IN_RELOAD )

                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_BACK ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_MOVELEFT ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_MOVERIGHT ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_JUMP ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_ATTACK ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_ATTACK2 ) ).to.beTrue()
                        expect( cmd:KeyDown( IN_RELOAD ) ).to.beTrue()

                        cmd:ClearButtons()

                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_BACK ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_MOVELEFT ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_MOVERIGHT ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_JUMP ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_ATTACK ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_ATTACK2 ) ).to.beFalse()
                        expect( cmd:KeyDown( IN_RELOAD ) ).to.beFalse()

                        done()
                    end )
                end )
            end
        },

        {
            name = "Works when called multiple times",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:ClearButtons", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        cmd:AddKey( IN_FORWARD )

                        cmd:ClearButtons()
                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()

                        cmd:ClearButtons()
                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()

                        done()
                    end )
                end )
            end
        }
    }
} )
