return WithFileTestTools( {
    groupName = "File:ReadShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadShort ).to.beA( "function" )
            end
        },

        {
            name = "Reads the short correctly",
            func = function( state )
                local expected = 32000

                local a = state.getTestFile( "ReadShort", true )
                a:WriteShort( expected )
                a:Close()

                local b = state.getTestFile( "ReadShort" )
                expect( b:ReadShort() ).to.equal( expected )
            end
        }
    }
} )
