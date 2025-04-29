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
                a:Flush()
                a:Write("Test456")
                
                local b = GetTestFile( "Flush" )
                expect( b:Read(7) ).to.equal( "Test123" )
                expect( b:Read(7) ).to.equal( nil )
                b:Close()

                a:Flush()
                
                local c = GetTestFile( "Flush" )
                expect( c:Read(7) ).to.equal( "Test123" )
                expect( c:Read(7) ).to.equal( "Test456" )
            end
        },
    }
}
