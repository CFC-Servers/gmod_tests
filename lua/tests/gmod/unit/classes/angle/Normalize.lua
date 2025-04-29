return {
    groupName = "Angle:Normalize",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Normalize ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:Normalize()
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 0, 181, 1 )

                a:Normalize()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( -179 )
                expect( r ).to.equal( 1 )
            end
        }
    }

}
