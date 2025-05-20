return WithFileTestTools( {
    groupName = "File:Seek",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Seek ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function( state )
                local a = state.getTestFile( "Seek", true )
                a:Write( "Hello World-Hello World2" )
                a:Close()

                local b = state.getTestFile( "Seek" )
                local ret = b:Seek( 12 )
                expect( ret ).to.beNil()

                expect( b:Read() ).to.equal( "Hello World2" )
            end
        }
    }
} )
