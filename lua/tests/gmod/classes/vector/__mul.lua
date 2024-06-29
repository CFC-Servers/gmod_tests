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
                local b = a:__mul( 2 )

                expect( b[1] ).to.equal( 2 )
                expect( b[2] ).to.equal( 4 )
                expect( b[3] ).to.equal( 6 )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 2, 3, 4 )
                local c = a:__mul( b )

                expect( c[1] ).to.equal( 2 )
                expect( c[2] ).to.equal( 6 )
                expect( c[3] ).to.equal( 12 )
            end
        },
    }
}
