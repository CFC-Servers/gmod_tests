return WithFileTestTools( {
    groupName = "File:ReadDouble",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadDouble ).to.beA( "function" )
            end
        },

        {
            name = "Reads a written double correctly",
            func = function( state )
                local expected = 1.0000000000001

                local a = state.getTestFile( "ReadDouble", true )
                a:WriteDouble( expected )
                a:Close()

                local b = state.getTestFile( "ReadDouble" )
                expect( b:ReadDouble() ).to.equal( expected )
            end
        }
    }
} )
