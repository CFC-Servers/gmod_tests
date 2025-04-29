return {
    groupName = "Angle:__div",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__div ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Angle( 1, 2, 3 )
                local b = a:__div( 2 )

                expect( b[1] ).to.equal( 0.5 )
                expect( b[2] ).to.equal( 1 )
                expect( b[3] ).to.equal( 1.5 )
            end
        },
    }
}
