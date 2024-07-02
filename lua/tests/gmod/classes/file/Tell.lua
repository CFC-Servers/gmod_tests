return {
    groupName = "File:Tell",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Tell ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write" )
                local skipAmount = 12

                a:Skip( skipAmount )

                expect( a:Tell() ).to.equal( skipAmount )
            end
        },
    }
}
