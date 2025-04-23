-- TODO: This is basically a duplicate of AddKey..

return WithBotTestTools( {
    groupName = "CUserCmd:KeyDown",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.KeyDown ).to.beA( "function" )
            end
        },

        {
            name = "Adds the given key to the CUserCmd",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:KeyDown", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()
                        cmd:AddKey( IN_FORWARD )
                        expect( cmd:KeyDown( IN_FORWARD ) ).to.beTrue()

                        done()
                    end )
                end )
            end
        },

        {
            name = "Does not add invalid keys to the CUserCmd",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:KeyDown", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:KeyDown( 0 ) ).to.beFalse()
                        cmd:AddKey( 0 )
                        expect( cmd:KeyDown( 0 ) ).to.beFalse()

                        done()
                    end )
                end )
            end
        },

        {
            name = "Negative numbers are... weird?",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:KeyDown", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        -- They seem to alternate in blocks of 4? Is this some bits maths thing
                        expect( cmd:KeyDown( -1 ) ).to.beTrue()
                        expect( cmd:KeyDown( -2 ) ).to.beTrue()
                        expect( cmd:KeyDown( -3 ) ).to.beTrue()
                        expect( cmd:KeyDown( -4 ) ).to.beTrue()

                        expect( cmd:KeyDown( -5 ) ).to.beFalse()
                        expect( cmd:KeyDown( -6 ) ).to.beFalse()
                        expect( cmd:KeyDown( -7 ) ).to.beFalse()
                        expect( cmd:KeyDown( -8 ) ).to.beFalse()

                        expect( cmd:KeyDown( -9 ) ).to.beTrue()
                        expect( cmd:KeyDown( -10 ) ).to.beTrue()
                        expect( cmd:KeyDown( -11 ) ).to.beTrue()
                        expect( cmd:KeyDown( -12 ) ).to.beTrue()

                        done()
                    end )
                end )
            end
        },

        {
            name = "Works fine with math.huge for some reason",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:KeyDown", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        expect( cmd:KeyDown( math.huge ) ).to.beFalse()
                        cmd:AddKey( math.huge )
                        expect( cmd:KeyDown( math.huge ) ).to.beTrue()

                        done()
                    end )
                end )
            end
        },

        {
            name = "Errors when given nil",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:KeyDown", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        local func = function()
                            cmd:KeyDown( nil )
                        end

                        expect( func ).to.errWith( "bad argument #1 to 'KeyDown' (number expected, got nil)" )

                        done()
                    end )
                end )
            end
        },
    }
} )
