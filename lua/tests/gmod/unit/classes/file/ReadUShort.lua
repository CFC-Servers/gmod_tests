return WithFileTestTools( {
    groupName = "File:ReadUShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadUShort ).to.beA( "function" )
            end
        },

        {
            name = "Reads the unsigned short correctly",
            func = function( state )
                local expected = 64000

                local a = state.getTestFile( "ReadUShort", true )
                a:WriteUShort( expected )
                a:Close()

                local b = state.getTestFile( "ReadUShort" )
                expect( b:ReadUShort() ).to.equal( 64000 )
            end
        }
    }
} )
