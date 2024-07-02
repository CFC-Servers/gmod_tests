return {
    groupName = "Vector:Length2DSqr",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Length2DSqr ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local length = a:Length2DSqr()

                expect( length ).to.equal( 5 )
            end
        },
    }
}
