return {
    groupName = "Vector:LengthSqr",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.LengthSqr ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local length = a:LengthSqr()

                expect( length ).to.equal( 14 )
            end
        },
    }
}
