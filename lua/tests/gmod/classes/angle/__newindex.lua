return {
    groupName = "Angle:__newindex",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__newindex ).to.beA( "function" )
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
            name = "Sets nothing",
            func = function()
                local a = Angle( 1, 2, 3 )

                a["1"] = 4
                a["2"] = 5
                a["3"] = 6
                expect( a[1] ).to.equal( 1 )
                expect( a[2] ).to.equal( 2 )
                expect( a[3] ).to.equal( 3 )
            end
        },

        {
            name = "Sets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                a[1] = 4
                a[2] = 5
                a[3] = 6
                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },

        {
            name = "Sets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                a.p = 4
                a.y = 5
                a.r = 6
                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },

        {
            name = "Sets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                a.pitch = 4
                a.yaw = 5
                a.roll = 6
                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },

        {
            name = "Sets the value",
            func = function()
                local a = Angle( 1, 2, 3 )

                a.x = 4
                a.y = 5
                a.z = 6
                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },
    }
}
