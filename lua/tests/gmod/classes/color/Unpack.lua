return {
    groupName = "Color:Unpack",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.Unpack ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper numbers",
            func = function()
                local a = Color( 1, 2, 3, 4 )

                local val1, val2, val3, val4 = a:Unpack()
                expect( val1 ).to.equal( 1 )
                expect( val2 ).to.equal( 2 )
                expect( val3 ).to.equal( 3 )
                expect( val4 ).to.equal( 4 )
            end
        }
    }
}