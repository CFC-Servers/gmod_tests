return {
    groupName = "Vector:Length2D",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Length2D ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local length = a:Length2D()

                expect( length ).to.equal( 2.2360680103302001953125 )
            end
        },
    }
}
