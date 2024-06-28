return {
    groupName = "Angle:SnapTo",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.SnapTo ).to.beA( "function" )
            end
        },

        {
            name = "Returns an Angle",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:SnapTo( "p", 45 )
                expect( out ).to.beA( "Angle" )
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 100, 180, 0 )

                a:SnapTo( "p", 45 )

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 90 )
                expect( y ).to.equal( 180 )
                expect( r ).to.equal( 0 )
            end
        },
        {
            name = "Returns an Angle equal to the modified base Angle",
            func = function()
                local a = Angle( 100, 180, 0 )

                local out = a:SnapTo( "p", 45 )

                local p, y, r = out[1], out[2], out[3]
                expect( p ).to.equal( 90 )
                expect( y ).to.equal( 180 )
                expect( r ).to.equal( 0 )

                expect( out ).to.equal( a )
            end
        }
    }
}
