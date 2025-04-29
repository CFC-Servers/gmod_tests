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
            name = "Writes a double correctly",
            func = function()
                local a = GetTestFile( "WriteDouble", true )
                local value = 1.0000000000001

                a:WriteDouble( value )
                a:Close()

                local b = GetTestFile( "WriteDouble" )
                expect( b:ReadDouble() ).to.equal( value )
            end
        },
    }
}
