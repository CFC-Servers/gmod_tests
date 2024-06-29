return {
    groupName = "File:ReadBool",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadBool ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteBool" )

                local val = a:ReadBool()

                expect( val ).to.equal( true )
            end
        },
    }
}
