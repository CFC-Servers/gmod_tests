return {
    groupName = "Angle:Right",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Right ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Vector",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:Right()
                expect( out ).to.beA( "Vector" )
            end
        },

        {
            name = "Returns the correct Vector",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:Right()
                local x, y, z = out[1], out[2], out[3]

                expect( x ).to.equal( 0 )
                expect( y ).to.equal( -1 )
                expect( z ).to.equal( 0 )
            end
        },

        {
            name = "Does not modify the Angle",
            func = function()
                local a = Angle( 1, 1, 1 )

                a:Right()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 1 )
                expect( r ).to.equal( 1 )
            end
        }
    }
}
