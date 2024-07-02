return {
    groupName = "File:WriteUInt64",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteUInt64 ).to.beA( "function" )
            end
        },

        {
            name = "Writes a uint64 correctly",
            func = function()
                local a = GetTestFile( "WriteUInt64", true )
                local value = "18000000000000000000"

                a:WriteUInt64( value )
                a:Close()

                local b = GetTestFile( "WriteUInt64" )
                expect( b:ReadUInt64() ).to.equal( value )
            end
        },
    }
}
