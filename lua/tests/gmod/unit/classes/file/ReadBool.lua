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
            name = "Reads the bool correctly",
            func = function()
                local a = GetTestFile( "WriteBool" )

                expect( a:ReadBool() ).to.beTrue()
                expect( a:ReadBool() ).to.beFalse()
                expect( a:ReadBool() ).to.beTrue()
            end
        },
    }
}
