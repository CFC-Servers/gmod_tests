return WithFileTestTools( {
    groupName = "File:ReadLong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadLong ).to.beA( "function" )
            end
        },

        {
            name = "Reads the long correctly",
            func = function( state )
                local expected = 2100000000

                local a = state.getTestFile( "ReadLong", true )
                a:WriteLong( expected )
                a:Close()

                local b = state.getTestFile( "ReadLong" )

                expect( b:ReadLong() ).to.equal( expected )
            end
        }
    }
} )
