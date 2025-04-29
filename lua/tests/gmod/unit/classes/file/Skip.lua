return {
    groupName = "File:Skip",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Skip ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write" )

                a:Skip( 12 )

                expect( a:Read() ).to.equal( "Hello World2" )
            end
        },
    }
}
