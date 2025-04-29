return {
    groupName = "File:Close",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Close ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Close", true )

                a:Close()

                expect( a:__tostring() ).to.equal( "File [NULL]" )
            end
        },
    }
}
