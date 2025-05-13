return WithFileTestTools( {
    groupName = "File:ReadULong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadULong ).to.beA( "function" )
            end
        },

        {
            name = "Reads the unsigned long correctly",
            func = function( state )
                local expected = 4200000000

                local a = state.getTestFile( "ReadULong", true )
                a:WriteULong( expected )
                a:Close()

                local b = state.getTestFile( "ReadULong" )
                expect( b:ReadULong() ).to.equal( expected )
            end
        }
    }
} )
