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
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteUInt64", true )
                a:WriteUInt64( "18000000000000000000" )
                a:Close()

                local b = GetTestFile( "WriteUInt64" )

                expect( b:ReadUInt64() ).to.equal( "18000000000000000000" )
            end
        },
    }
}
