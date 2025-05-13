return WithFileTestTools( {
    groupName = "File:Tell",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Tell ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function( state )
                local a = state.getTestFile( "Tell", true )
                a:Write( "Hello World" )
                a:Close()

                local b = state.getTestFile( "Tell" )
                local skipAmount = 10
                b:Skip( skipAmount )

                expect( b:Tell() ).to.equal( skipAmount )
            end
        }
    }
} )
