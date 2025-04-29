return {
    groupName = "Vector:__add",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.__add ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 1, 1, 1 )
                local c = a:__add( b )

                expect( c[1] ).to.equal( 2 )
                expect( c[2] ).to.equal( 3 )
                expect( c[3] ).to.equal( 4 )
            end
        },
    }
}
