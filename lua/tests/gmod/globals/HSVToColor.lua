return {
    groupName = "Global:HSVToColor",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( HSVToColor ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right table",
            func = function()
                local tbl = HSVToColor( 60, 1, 1 )
                expect( tbl.r ).to.equal( 255 )
                expect( tbl.g ).to.equal( 255 )
                expect( tbl.b ).to.equal( 0 )
                expect( tbl.a ).to.equal( 255 )
                --expect( IsColor(tbl) ).to.beTrue() -- NOTE: https://github.com/Facepunch/garrysmod-issues/issues/2407
            end
        },
    }
}
