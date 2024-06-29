return {
    groupName = "Angle:__mul",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__mul ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Angle( 1, 2, 3 )
                local b = a:__mul( 2 )

                expect( b[1] ).to.equal( 2 )
                expect( b[2] ).to.equal( 4 )
                expect( b[3] ).to.equal( 6 )
            end
        },
    }
}
