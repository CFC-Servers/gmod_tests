return {
    groupName = "Vector:__mul",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.__mul ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                a:Mul( 2 ) -- Undocumented that Vecotr:Mul can take a number

                expect( a[1] ).to.equal( 2 )
                expect( a[2] ).to.equal( 4 )
                expect( a[3] ).to.equal( 6 )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 2, 3, 4 )
                a:Mul( b )

                expect( a[1] ).to.equal( 2 )
                expect( a[2] ).to.equal( 6 )
                expect( a[3] ).to.equal( 12 )
            end
        },
    }
}
