return {
    groupName = "Angle:Unpack",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Unpack ).to.beA( "function" )
            end
        },

        {
            name = "Returns three numbers",
            func = function()
                local a = Angle( 1, 2, 3 )

                local p, y, r = a:Unpack()
                expect( p ).to.beA( "number" )
                expect( y ).to.beA( "number" )
                expect( r ).to.beA( "number" )
            end
        },

        {
            name = "Returns the correct numbers",
            func = function()
                local a = Angle( 1, 2, 3 )

                local p, y, r = a:Unpack()
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 2 )
                expect( r ).to.equal( 3 )
            end
        },

        {
            name = "Does not modify the Angle",
            func = function()
                local a = Angle( 1, 2, 3 )

                a:Unpack()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 2 )
                expect( r ).to.equal( 3 )
            end
        }
    }
}
