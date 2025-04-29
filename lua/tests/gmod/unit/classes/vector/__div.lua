return {
    groupName = "Vector:__div",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.__div ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:__div( 2 )

                expect( b[1] ).to.equal( 0.5 )
                expect( b[2] ).to.equal( 1 )
                expect( b[3] ).to.equal( 1.5 )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 2, 4, 0.5 )
                local c = a:__div( b )

                expect( c[1] ).to.equal( 0.5 )
                expect( c[2] ).to.equal( 0.5 )
                expect( c[3] ).to.equal( 6 )
            end
        },
    }
}
