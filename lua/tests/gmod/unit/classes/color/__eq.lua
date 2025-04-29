return {
    groupName = "Color:__eq",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.__eq ).to.beA( "function" )
            end
        },

        {
            name = "Matches the proper objects",
            func = function()
                local a = Color( 1, 2, 3, 4 )
                local b = Color( 1, 2, 3, 4 )
                local c = Color( 5, 6, 7, 8 )

                expect( a ).to.equal( b )
                expect( a ).toNot.equal( c )
            end
        }
    }
}