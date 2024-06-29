return {
    groupName = "File:Write",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Write ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write", true )

                a:Write("Hello World\nHello World2")
                a:Close()

                local b = GetTestFile( "Write" )

                expect( b:Read() ).to.equal( "Hello World\nHello World2" )
            end
        },
    }
}
