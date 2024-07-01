return {
    groupName = "File:WriteFloat",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteFloat ).to.beA( "function" )
            end
        },

        {
            name = "Writes a float correctly",
            func = function()
                local a = GetTestFile( "WriteFloat", true )

                a:WriteFloat( 1.0000001 )
                a:Close()

                local b = GetTestFile( "WriteFloat" )
                expect( b:ReadFloat() ).to.equal( 1.0000001192092895507812 )
            end
        },
    }
}
