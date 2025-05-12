return WithFileTestTools( {
    groupName = "File:Close",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Close ).to.beA( "function" )
            end
        },

        {
            name = "Changes the output of the __tostring method to indicate closure",
            func = function( state )
                local f = state.getTestFile( "Close", true )

                --- @diagnostic disable-next-line undefined-field
                expect( f:__tostring() ).notTo.equal( "File [NULL]" )

                f:Close()

                --- @diagnostic disable-next-line undefined-field
                expect( f:__tostring() ).to.equal( "File [NULL]" )
            end
        }
    }
} )
