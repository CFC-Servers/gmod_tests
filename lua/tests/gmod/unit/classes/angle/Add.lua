return {
    groupName = "Angle:Add",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Add ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 1, 1, 1 )

                local out = a:Add( b )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies only the base Angle",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 1, 1, 1 )

                a:Add( b )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 2 )
                expect( y1 ).to.equal( 2 )
                expect( r1 ).to.equal( 2 )

                local p2, y2, r2 = b[1], b[2], b[3]
                expect( p2 ).to.equal( 1 )
                expect( y2 ).to.equal( 1 )
                expect( r2 ).to.equal( 1 )
            end
        }
    }
}
