return {
    groupName = "File:Seek",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Seek ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write" )

                a:Seek( 12 )

                expect( a:Read() ).to.equal( "Hello World2" )
            end
        },
    }
}
