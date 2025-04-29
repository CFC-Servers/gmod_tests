return {
    groupName = "File:ReadUInt64",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadUInt64 ).to.beA( "function" )
            end
        },

        {
            name = "Reads the uint64 correctly",
            func = function()
                local a = GetTestFile( "WriteUInt64" )

                local val = a:ReadUInt64()

                expect( val ).to.equal( "18000000000000000000" )
            end
        },
    }
}
