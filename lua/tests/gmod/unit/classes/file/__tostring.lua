return WithFileTestTools( {
    groupName = "File:__tostring",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function( state )
                local a = state.getTestFile( "__tostring", true )

                --- @diagnostic disable-next-line undefined-field
                expect( a:__tostring() ).to.equal( "File" )
            end
        }
    }
} )
