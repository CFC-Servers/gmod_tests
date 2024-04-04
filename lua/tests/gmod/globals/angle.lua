return{
    groupName = "Angle",

    cases = {
        {
            name = "Function exists globally",
            func = function()
                expect( Angle ).to.beA( "function" )
            end
        },
        
        {
            name = "Returns an Angle object",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle ).to.beA( "Angle" )
            end
        },

        {
            name = "Pitch equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle.x ).to.equal( 1 )
                expect( angle.p ).to.equal( 1 )
                expect( angle.pitch ).to.equal( 1 )
            end
        },

        {
            name = "Yaw equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle.y ).to.equal( 2 )
                expect( angle.yaw ).to.equal( 2 )
            end
        },

        {
            name = "Roll equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle.z ).to.equal( 3 )
                expect( angle.r ).to.equal( 3 )
                expect( angle.roll ).to.equal( 3 )
            end
        },

        {
            name = "Accepts negative values",
            func = function()
                local angle = Angle( -99, -0, 50 )
                expect( angle.pitch ).to.equal( -99 )
                expect( angle.yaw   ).to.equal( -0 )
                expect( angle.roll  ).to.equal( 50 )
            end
        },

        {
            name = "Accepts decimals",
            func = function()
                local angle = Angle( 0.001, 80, 100.000 )
                expect( angle.pitch ).to.equal( 0.001 )
                expect( angle.yaw   ).to.equal( 80 )
                expect( angle.roll  ).to.equal( 100 )
            end
        },
        
        
    }
}