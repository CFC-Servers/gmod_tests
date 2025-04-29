return WithBotTestTools( {
    groupName = "CUserCmd:RemoveKey",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.RemoveKey ).to.beA( "function" )
            end
        },

        {
            name = "Removes the given key from the CUserCmd",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:RemoveKey", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:AddKey( IN_FORWARD )
                    expect( cmd:KeyDown( IN_FORWARD ) ).to.beTrue()

                    cmd:RemoveKey( IN_FORWARD )
                    expect( cmd:KeyDown( IN_FORWARD ) ).to.beFalse()

                    done()
                end )
            end
        },

        {
            name = "Works fine with math.huge for some reason",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:RemoveKey", function( ply, cmd )
                    if ply ~= bot then return end

                    cmd:AddKey( math.huge )
                    expect( cmd:KeyDown( math.huge ) ).to.beTrue()

                    cmd:RemoveKey( math.huge )
                    expect( cmd:KeyDown( math.huge ) ).to.beFalse()

                    done()
                end )
            end
        },

        {
            name = "Errors when given nil",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:RemoveKey", function( ply, cmd )
                    if ply ~= bot then return end

                    local func = function()
                        cmd:RemoveKey( nil )
                    end

                    expect( func ).to.errWith( "bad argument #1 to 'RemoveKey' (number expected, got nil)" )

                    done()
                end )
            end
        },
    }
} )
