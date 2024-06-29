return {
    groupName = "Angle:__index",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__index ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 2, 3 )

                a.test = 123
                expect( a.test ).to.beNil()
            end
        },

		{
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 2, 3 )

                expect( a["1"] ).to.equal( nil )
                expect( a["2"] ).to.equal( nil )
                expect( a["3"] ).to.equal( nil )
            end
        },

        {
            name = "Gets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                expect( a[1] ).to.equal( 1 )
                expect( a[2] ).to.equal( 2 )
                expect( a[3] ).to.equal( 3 )
            end
        },

        {
            name = "Gets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                expect( a.p ).to.equal( 1 )
                expect( a.y ).to.equal( 2 )
                expect( a.r ).to.equal( 3 )
            end
        },

        {
            name = "Gets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                expect( a.pitch ).to.equal( 1 )
                expect( a.yaw ).to.equal( 2 )
                expect( a.roll ).to.equal( 3 )
            end
        },

        {
            name = "Gets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                expect( a.x ).to.equal( 1 )
                expect( a.y ).to.equal( 2 )
                expect( a.z ).to.equal( 3 )
            end
        },
    }
}
