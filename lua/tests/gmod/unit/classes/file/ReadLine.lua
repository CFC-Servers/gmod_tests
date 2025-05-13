return WithFileTestTools( {
    groupName = "File:ReadLine",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadLine ).to.beA( "function" )
            end
        },

        {
            name = "Reads the lines correctly",
            func = function( state )
                local a = state.getTestFile( "ReadLine", true )
                a:Write( "Hello World\n" )
                a:Write( "Hello World2" )
                a:Close()

                local b = state.getTestFile( "ReadLine" )

                expect( b:ReadLine() ).to.equal( "Hello World\n" )
                expect( b:ReadLine() ).to.equal( "Hello World2" )
            end
        }
    }
} )
