return WithBotTestTools( {
    groupName = "CUserCmd:GetViewAngles",

    cases = {
        {
            name = "Exists on the CUserCmd Metatable",
            func = function()
                local meta = FindMetaTable( "CUserCmd" )
                expect( meta.GetViewAngles ).to.beA( "function" )
            end
        },

        {
            name = "Returns the currently set View Angles",
            async = true,
            timeout = 0.1,
            func = function( state )
                local bot = state.addBot()

                hook.Add( "StartCommand", "CUserCmd:GetViewAngles", function( ply, cmd )
                    if ply ~= bot then return end

                    ProtectedCall( function()
                        local ang1 = Angle( 1, 2, 3 )
                        cmd:SetViewAngles( ang1 )
                        expect( cmd:GetViewAngles() ).to.equal( ang1 )

                        local ang2 = Angle( 999, 999, 999 )
                        cmd:SetViewAngles( ang2 )
                        expect( cmd:GetViewAngles() ).to.equal( ang2 )

                        local ang3 = Angle( -360, -360, -360 )
                        cmd:SetViewAngles( ang3 )
                        expect( cmd:GetViewAngles() ).to.equal( ang3 )

                        done()
                    end )
                end )
            end
        }
    }
} )
