return {
    groupName = "File:EndOfFile",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.EndOfFile ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write" )

                a:Read()

                expect( a:EndOfFile() ).to.beTrue()
            end
        },
    }
}
