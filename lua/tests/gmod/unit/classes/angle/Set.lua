return {
    groupName = "Angle:Set",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Set ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 0, 0, 0 )

                local out = a:Set( b )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 0, 0, 0 )

                a:Set( b )

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 0 )
            end
        },

        {
            name = "Does not modify the given Angle",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 0, 0, 0 )

                a:Set( b )

                local p, y, r = b[1], b[2], b[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 0 )
            end
        }
    }
}
