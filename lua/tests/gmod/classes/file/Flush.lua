return {
    groupName = "File:Flush",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Flush ).to.beA( "function" )
            end
        },

        {
            name = "Works properly",
            func = function()
                local a = GetTestFile( "Flush", true )
                a:Write("Test123")
                a:Close()

                local b = GetTestFile( "Flush", true )
                b:Write("Test456")
                
                local c = GetTestFile( "Flush" )
                expect( c:Read() ).to.equal( "Test123" )
                c:Close()

                b:Flush()
                
                local d = GetTestFile( "Flush" )
                expect( d:Read() ).to.equal( "Test456" )
                d:Close()
            end
        },
    }
}
