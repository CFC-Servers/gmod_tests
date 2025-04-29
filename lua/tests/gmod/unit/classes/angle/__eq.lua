return {
    groupName = "Angle:__eq",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__eq ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Angle( 1, 2, 3 )
                local b = Angle( 1, 2, 3 )
                local c = Angle( 4, 5, 6 )
                local d = Vector( 1, 2, 3 )

                expect( a ).to.equal( b )
                expect( a ).toNot.equal( c )
                expect( a ).toNot.equal( d )
            end
        },
    }
}
