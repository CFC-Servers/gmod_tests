return {
    groupName = "Vector:SetUnpacked",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.SetUnpacked ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                a:SetUnpacked( 4, 5, 6 )

                expect( a[1] ).to.equal( 4 )
                expect( a[2] ).to.equal( 5 )
                expect( a[3] ).to.equal( 6 )
            end
        },
    }
}
