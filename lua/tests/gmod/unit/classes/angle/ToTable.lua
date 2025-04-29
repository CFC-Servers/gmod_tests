return {
    groupName = "Angle:ToTable",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.ToTable ).to.beA( "function" )
            end
        },

        {
            name = "Returns a table",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:ToTable()
                expect( out ).to.beA( "table" )
            end
        },

        {
            name = "Returns the correct table",
            func = function()
                local a = Angle( 1, 2, 3 )

                local out = a:ToTable()
                local p, y, r = out[1], out[2], out[3]

                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 2 )
                expect( r ).to.equal( 3 )
            end
        },

        {
            name = "Does not modify the Angle",
            func = function()
                local a = Angle( 1, 2, 3 )

                a:ToTable()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 1 )
                expect( y ).to.equal( 2 )
                expect( r ).to.equal( 3 )
            end
        }
    }
}
