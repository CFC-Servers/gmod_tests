return {
    groupName = "File:ReadUShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadUShort ).to.beA( "function" )
            end
        },

        {
            name = "Reads the unsigned short correctly",
            func = function()
                local a = GetTestFile( "WriteUShort" )

                local val = a:ReadUShort()

                expect( val ).to.equal( 64000 )
            end
        },
    }
}
