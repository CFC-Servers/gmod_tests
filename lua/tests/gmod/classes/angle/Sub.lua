return {
    groupName = "Angle:Sub",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Sub ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0, 0, 0 )

                local out = a:Sub( b )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 2, 2, 2 )
                local b = Angle( 1, 1, 1 )

                a:Sub( b )

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 1 )
                expect( r ).to.equal( 1 )
            end
        }
    }
}
