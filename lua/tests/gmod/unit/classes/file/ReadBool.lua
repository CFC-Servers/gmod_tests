return WithFileTestTools( {
    groupName = "File:ReadBool",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.ReadBool ).to.beA( "function" )
            end
        },

        {
            name = "Reads written booleans correctly",
            func = function( state )
                local a = state.getTestFile( "ReadBool", true )
                a:WriteBool( true )
                a:WriteBool( false )
                a:WriteBool( true )
                a:Close()

                local b = state.getTestFile( "ReadBool" )
                expect( b:ReadBool() ).to.beTrue()
                expect( b:ReadBool() ).to.beFalse()
                expect( b:ReadBool() ).to.beTrue()
            end
        }
    }
} )
