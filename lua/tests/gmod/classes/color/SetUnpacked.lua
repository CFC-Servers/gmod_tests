return {
    groupName = "Color:SetUnpacked",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.SetUnpacked ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper numbers",
            func = function()
                local a = Color( 0, 0, 0, 0 )

                a:SetUnpacked( 1, 2, 3, 4 )
                expect( a.r ).to.equal( 1 )
                expect( a.g ).to.equal( 2 )
                expect( a.b ).to.equal( 3 )
                expect( a.a ).to.equal( 4 )
            end
        }
    }
}