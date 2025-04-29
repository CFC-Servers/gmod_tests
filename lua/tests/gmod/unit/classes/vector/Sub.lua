return {
    groupName = "Vector:Sub",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Sub ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 1, 1, 1 )
                a:Sub( b )

                expect( a[1] ).to.equal( 0 )
                expect( a[2] ).to.equal( 1 )
                expect( a[3] ).to.equal( 2 )
            end
        },
    }
}
