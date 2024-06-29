return {
    groupName = "Vector:Distance2DSqr",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Distance2DSqr ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 4, 5, 6 )
                local dist = a:Distance2DSqr( b )

                expect( dist ).to.equal( 18 )
            end
        },
    }
}
