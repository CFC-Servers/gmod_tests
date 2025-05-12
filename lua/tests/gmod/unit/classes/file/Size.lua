return WithFileTestTools( {
    groupName = "File:Size",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Size ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function( state )
                local a = state.getTestFile( "Size", true )
                a:Write( "Hello World" )
                a:Close()

                local b = state.getTestFile( "Size" )

                expect( b:Size() ).to.equal( 11 )
            end
        },

        {
            name = "Returns 0 size when file isn't in read mode",
            func = function( state )
                local a = state.getTestFile( "Size", true )
                a:Write( "Hello World" )

                expect( a:Size() ).to.equal( 0 ) -- Undocumented: (Verify again)BUG: All Read* and Size functions will fail on a file that isn't in read mode.
            end
        },

        {
            name = "Returns 0 size when file isn't in read mode",
            func = function( state )
                local a = state.getTestFile( "Size", true )
                a:Write( "Hello World" )
                a:Close()

                local b = state.getTestFile( "Size", true )

                expect( b:Size() ).to.equal( 0 ) -- Undocumented: (Verify again)BUG: All Read* and Size functions will fail on a file that isn't in read mode.
            end
        }
    }
} )
