return {
    groupName = "Vector:Set",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Set ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 4, 5, 6 )

                a:Set( b )

                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },
    }
}
