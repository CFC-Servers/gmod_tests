return {
    groupName = "Vector:Angle",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Angle ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:Angle()

                expect( b[1] ).to.equal( 306.69921875 )
                expect( b[2] ).to.equal( 63.434947967529296875 )
                expect( b[3] ).to.equal( 0 )
            end
        },
    }
}
