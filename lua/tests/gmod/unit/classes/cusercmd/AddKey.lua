return WithBotTestTools( {
    groupName = "CUserCmd:AddKey",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.AddKey ).to.beA( "function" )
            end
        },

        {
            name = "Adds the given key to the CUserCmd",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:AddKey", function( ply, cmd )
                    if ply ~= bot then return end

                    expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()
                    cmd:AddKey( IN_FORWARD )
                    expect( cmd:KeyDown( IN_FORWARD ) ).to.beTrue()

                    done()
                end )
            end
        },

        {
            name = "Does not add invalid keys to the CUserCmd",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:AddKey", function( ply, cmd )
                    if ply ~= bot then return end

                    expect( cmd:KeyDown( 0 ) ).to.beFalse()
                    cmd:AddKey( 0 )
                    expect( cmd:KeyDown( 0 ) ).to.beFalse()

                    done()
                end )
            end
        },

        {
            name = "Works fine with math.huge for some reason",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:AddKey", function( ply, cmd )
                    if ply ~= bot then return end

                    expect( cmd:KeyDown( math.huge ) ).to.beFalse()
                    cmd:AddKey( math.huge )
                    expect( cmd:KeyDown( math.huge ) ).to.beTrue()

                    done()
                end )
            end
        },

        {
            name = "Errors when given nil",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot( "TestBot" )

                hook.Add( "StartCommand", "CUserCmd:AddKey", function( ply, cmd )
                    if ply ~= bot then return end

                    local func = function()
                        cmd:AddKey( nil )
                    end

                    expect( func ).to.errWith( "bad argument #1 to 'AddKey' (number expected, got nil)" )

                    done()
                end )
            end
        },
    }
} )
