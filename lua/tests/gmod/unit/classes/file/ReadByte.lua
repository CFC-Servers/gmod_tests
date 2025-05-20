return WithFileTestTools( {
    groupName = "File:ReadByte",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadByte ).to.beA( "function" )
            end
        },

        {
            name = "Reads a written byte correctly",
            func = function( state )
                local a = state.getTestFile( "ReadByte", true )
                a:WriteByte( 123 )
                a:Close()

                local b = state.getTestFile( "ReadByte" )
                expect( b:ReadByte() ).to.equal( 123 )
            end
        }
    }
} )
