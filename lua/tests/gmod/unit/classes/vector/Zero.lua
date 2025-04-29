return {
    groupName = "Vector:Zero",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Zero ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )

                a:Zero()

                expect( a[1] ).to.equal( 0 )
                expect( a[2] ).to.equal( 0 )
                expect( a[3] ).to.equal( 0 )
            end
        },
    }
}
