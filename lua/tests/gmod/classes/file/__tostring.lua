return {
    groupName = "File:__tostring",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "__tostring", true )

                expect( a:__tostring() ).to.equal( "File" )
            end
        },
    }
}
