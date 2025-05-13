return WithFileTestTools( {
    groupName = "File:ReadFloat",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadFloat ).to.beA( "function" )
            end
        },

        {
            name = "Reads a written float correctly",
            func = function( state )
                local value = 1.0000001192092895507812

                local a = state.getTestFile( "ReadFloat", true )
                a:WriteFloat( value )
                a:Close()

                local b = state.getTestFile( "ReadFloat" )
                expect( b:ReadFloat() ).to.equal( value )
            end
        }
    }
} )
