return WithFileTestTools( {
    groupName = "File:Flush",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Flush ).to.beA( "function" )
            end
        },

        {
            name = "Works properly",
            func = function( state )
                local a = state.getTestFile( "Flush", true )
                a:Write( "Test123" )
                a:Flush()
                a:Write( "Test456" )

                local b = state.getTestFile( "Flush" )
                expect( b:Read( 7 ) ).to.equal( "Test123" )
                expect( b:Read( 7 ) ).to.equal( nil )
                b:Close()

                a:Flush()

                local c = state.getTestFile( "Flush" )
                expect( c:Read( 7 ) ).to.equal( "Test123" )
                expect( c:Read( 7 ) ).to.equal( "Test456" )
            end
        }
    }
} )
