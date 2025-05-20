return WithFileTestTools( {
    groupName = "File:Read",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Read ).to.beA( "function" )
            end
        },

        {
            name = "Reads the string correctly",
            func = function( state )
                local expected = "Hello World"

                local a = state.getTestFile( "Read", true )
                a:Write( expected )
                a:Close()

                local b = state.getTestFile( "Read" )
                expect( b:Read( 11 ) ).to.equal( "Hello World" )
            end
        },

        {
            name = "Reads the entire file correctly",
            func = function( state )
                local expected = "Hello World\nHello World2"

                local a = state.getTestFile( "Read", true )
                a:Write( expected )
                a:Close()

                local b = state.getTestFile( "Read" )
                expect( b:Read() ).to.equal( expected )
            end
        }
    }
} )
