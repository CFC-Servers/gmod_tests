return {
    groupName = "Vector:__eq",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.__eq ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 1, 2, 3 )
                local c = Vector( 4, 5, 6 )
                local d = Angle( 1, 2, 3 )

                expect( a ).to.equal( b )
                expect( a ).toNot.equal( c )
                expect( a ).toNot.equal( d )
            end
        },
    }
}
