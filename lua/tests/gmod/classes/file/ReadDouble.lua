return {
    groupName = "File:ReadDouble",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadDouble ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteDouble" )

                local val = a:ReadDouble()

                expect( val ).to.equal( 1.0000000000001 )
            end
        },
    }
}
