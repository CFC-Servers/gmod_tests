return {
    groupName = "Vector:Distance",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Distance ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 4, 5, 6 )
                local dist = a:Distance( b )

                expect( dist ).to.equal( 5.1961522102355957031250 )
            end
        },
    }
}
