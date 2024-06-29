return {
    groupName = "File:WriteByte",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteByte ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteByte", true )
                a:WriteByte( 123 )
                a:Close()

                local b = GetTestFile( "WriteByte" )

                expect( b:ReadByte() ).to.equal( 123 )
            end
        },
    }
}
