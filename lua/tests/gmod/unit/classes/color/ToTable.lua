return {
    groupName = "Color:ToTable",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.ToTable ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper table",
            func = function()
                local a = Color( 1, 2, 3, 4 )

                local tbl = a:ToTable()
                expect( tbl[1] ).to.equal( 1 )
                expect( tbl[2] ).to.equal( 2 )
                expect( tbl[3] ).to.equal( 3 )
                expect( tbl[4] ).to.equal( 4 )
            end
        }
    }
}