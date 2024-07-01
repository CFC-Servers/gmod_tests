return {
    groupName = "File:ReadLine",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadLine ).to.beA( "function" )
            end
        },

        {
            name = "Reads the lines correctly",
            func = function()
                local a = GetTestFile( "Write" )

                local str1 = a:ReadLine()
                local str2 = a:ReadLine()

                expect( str1 ).to.equal( "Hello World\n" )
                expect( str2 ).to.equal( "Hello World2" )
            end
        },
    }
}
