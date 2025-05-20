return WithFileTestTools( {
    groupName = "File:__gc",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.__gc ).to.beA( "function" )
            end
        },

        {
            name = "Changes the output of __tostring",
            func = function( state )
                local f = state.getTestFile( "__gc", true )

                --- @diagnostic disable-next-line undefined-field
                expect( f:__tostring() ).to.equal( "File" )

                --- @diagnostic disable-next-line undefined-field
                f:__gc()

                --- @diagnostic disable-next-line undefined-field
                expect( f:__tostring() ).to.equal( "File [NULL]" )
            end
        }
    }
} )
