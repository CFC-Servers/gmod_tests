return WithFileTestTools( {
    groupName = "File:Skip",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Skip ).to.beA( "function" )
            end
        },

        {
            name = "Moves the pointer by the specified number of characcters",
            func = function( state )
                local a = state.getTestFile( "Skip", true )
                a:Write( "Hello World-Hello World2" )
                a:Close()

                local b = state.getTestFile( "Skip" )
                local ret = b:Skip( 12 )
                expect( ret ).to.beNil()

                expect( b:Read() ).to.equal( "Hello World2" )
            end
        }
    }
} )
