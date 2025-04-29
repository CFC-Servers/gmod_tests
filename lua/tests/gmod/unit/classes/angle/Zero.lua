return {
    groupName = "Angle:Zero",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Zero ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:Zero()
                expect( out ).to.beNil()
            end
        },

        {
            name = "Zeroes out the Angle",
            func = function()
                local a = Angle( 1, 1, 1 )

                a:Zero()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 0 )
            end
        }
    }
}
