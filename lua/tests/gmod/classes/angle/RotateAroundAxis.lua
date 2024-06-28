return {
    groupName = "Angle:RotateAroundAxis",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.RotateAroundAxis ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )
                local axis = Vector( 1, 0, 0 )

                local out = a:RotateAroundAxis( axis, 1 )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 0, 0, 90 )
                local axis = Vector( 1, 0, 0 )

                a:RotateAroundAxis( axis, 90 )

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 180 )
            end
        },
    }
}
