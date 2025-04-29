return {
    groupName = "Angle:Up",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Up ).to.beA( "function" )
            end
        },

        {
            name = "Returns the correct Angle",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:Up()
                local p, y, r = out[1], out[2], out[3]

                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 1 )
            end
        },

        {
            name = "Does not modify the Angle",
            func = function()
                local a = Angle( 1, 1, 1 )

                a:Up()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 1 )
                expect( r ).to.equal( 1 )
            end
        }
    }
}
