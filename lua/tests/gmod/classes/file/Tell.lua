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

                a:Skip( 12 )

                expect( a:Tell() ).to.equal( 12 )
            end
        },
    }
}
