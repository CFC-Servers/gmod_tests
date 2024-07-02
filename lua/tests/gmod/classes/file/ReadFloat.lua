return {
    groupName = "File:ReadFloat",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadFloat ).to.beA( "function" )
            end
        },

        {
            name = "Reads the float correctly",
            func = function()
                local a = GetTestFile( "WriteFloat" )

                local val = a:ReadFloat()

                expect( val ).to.equal( 1.0000001192092895507812 )
            end
        },
    }
}
