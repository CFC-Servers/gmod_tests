return {
    groupName = "Vector:Unpack",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Unpack ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local x, y, z = a:Unpack()

                expect( x ).to.equal( 1 )
                expect( y ).to.equal( 2 )
                expect( z ).to.equal( 3 )
            end
        },
    }
}
