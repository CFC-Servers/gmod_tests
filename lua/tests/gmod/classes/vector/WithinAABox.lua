return {
    groupName = "Vector:WithinAABox",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.WithinAABox ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 0, 0, 0 )
                local b = Vector( 10, 10, 10 )
                local c = Vector( 5, 5, 5 )
                local d = Vector( -5, -5, -5 )

                expect( c:WithinAABox( a, b ) ).to.beTrue()
                expect( d:WithinAABox( a, b ) ).to.beFalse()
            end
        },
    }
}
