return {
    groupName = "File:WriteDouble",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteDouble ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteDouble", true )
                a:WriteDouble( 1.0000000000001 )
                a:Close()

                local b = GetTestFile( "WriteDouble" )

                expect( b:ReadDouble() ).to.equal( 1.0000000000001 )
            end
        },
    }
}
