return WithFileTestTools( {
    groupName = "File:ReadUInt64",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadUInt64 ).to.beA( "function" )
            end
        },

        {
            name = "Reads the uint64 correctly",
            func = function( state )
                local expected = "18000000000000000000"

                local a = state.getTestFile( "WriteUInt64", true )
                a:WriteUInt64( expected )
                a:Close()

                local b = state.getTestFile( "WriteUInt64" )
                expect( b:ReadUInt64() ).to.equal( expected )
            end
        }
    }
} )
