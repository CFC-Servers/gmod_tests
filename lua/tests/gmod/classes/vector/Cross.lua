return {
    groupName = "Vector:Cross",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Cross ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 4, 5, 6 )
                local c = a:Cross( b )

                expect( c[1] ).to.equal( -3 )
                expect( c[2] ).to.equal( 6 )
                expect( c[3] ).to.equal( -3 )
            end
        },
    }
}
