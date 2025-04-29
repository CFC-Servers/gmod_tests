return {
    groupName = "File:Read",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Read ).to.beA( "function" )
            end
        },

        {
            name = "Reads the string correctly",
            func = function()
                local a = GetTestFile( "Write" )

                local str = a:Read( 11 )

                expect( str ).to.equal( "Hello World" )
            end
        },

        {
            name = "Reads the entire file correctly",
            func = function()
                local a = GetTestFile( "Write" )

                local str = a:Read()

                expect( str ).to.equal( "Hello World\nHello World2" )
            end
        },
    }
}
