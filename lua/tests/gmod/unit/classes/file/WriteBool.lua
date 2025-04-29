return {
    groupName = "File:WriteBool",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteBool ).to.beA( "function" )
            end
        },

        {
            name = "Writes a series of booleans correctly",
            func = function()
                local a = GetTestFile( "WriteBool", true )
                a:WriteBool( true )
                a:WriteBool( false )
                a:WriteBool( true )
                a:Close()

                local b = GetTestFile( "WriteBool" )

                expect( b:ReadBool() ).to.beTrue()
                expect( b:ReadBool() ).to.beFalse()
                expect( b:ReadBool() ).to.beTrue()
            end
        },
    }
}
