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
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteBool", true )
                a:WriteBool( true )
                a:WriteBool( false )
                a:WriteBool( true )
                a:Close()

                local b = GetTestFile( "WriteBool" )

                expect( b:ReadBool() ).to.equal( true )
                expect( b:ReadBool() ).to.equal( false )
                expect( b:ReadBool() ).to.equal( true )
            end
        },
    }
}
