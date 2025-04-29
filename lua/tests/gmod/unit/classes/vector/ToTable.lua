return {
    groupName = "Vector:ToTable",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.ToTable ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:ToTable()

                expect( b[1] ).to.equal( 1 )
                expect( b[2] ).to.equal( 2 )
                expect( b[3] ).to.equal( 3 )
            end
        },
    }
}
