return {
    groupName = "Color:__tostring",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper string",
            func = function()
                local a = Color( 1, 2, 3, 4 )

                local str = a:__tostring()
                expect( str ).to.equal( "1 2 3 4" )
            end
        }
    }
}