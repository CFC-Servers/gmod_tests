return {
    groupName = "File:ReadByte",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadByte ).to.beA( "function" )
            end
        },

        {
            name = "Reads the byte correctly",
            func = function()
                local a = GetTestFile( "WriteByte" )

                local val = a:ReadByte()

                expect( val ).to.equal( 123 )
            end
        },
    }
}
