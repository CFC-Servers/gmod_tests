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
            name = "Writes a byte correctly",
            func = function()
                local a = GetTestFile( "WriteByte", true )
                local value = 123

                a:WriteByte( value )
                a:Close()

                local b = GetTestFile( "WriteByte" )
                expect( b:ReadByte() ).to.equal( value )
            end
        },
    }
}
