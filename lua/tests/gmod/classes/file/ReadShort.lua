return {
    groupName = "File:ReadShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadShort ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteShort" )

                local val = a:ReadShort()

                expect( val ).to.equal( 32000 )
            end
        },
    }
}
