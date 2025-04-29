return {
    groupName = "Color:ToVector",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.ToVector ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper vector",
            func = function()
                local a = Color( 127.5, 63.75, 31.875 )

                local vec = a:ToVector()
                expect( vec[1] ).to.equal( 0.5 )
                expect( vec[2] ).to.equal( 0.25 )
                expect( vec[3] ).to.equal( 0.125 )
            end
        }
    }
}