return WithFileTestTools( {
    groupName = "File:EndOfFile",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.EndOfFile ).to.beA( "function" )
            end
        },

        {
            name = "Returns true when the pointer reaches the end of the file",
            func = function( state )
                local a = state.getTestFile( "EndOfFile" )
                expect( a:EndOfFile() ).to.beTrue()
                a:Close()

                local b = state.getTestFile( "EndOfFile", true )
                b:Write( "Hello World" )
                expect( b:EndOfFile() ).to.beTrue()
                b:Close()

                local c = state.getTestFile( "EndOfFile" )
                expect( c:EndOfFile() ).to.beFalse()
                c:Read()
                expect( c:EndOfFile() ).to.beTrue()
            end
        }
    }
} )
