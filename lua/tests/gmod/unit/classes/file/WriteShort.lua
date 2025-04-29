return {
    groupName = "File:WriteShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteShort ).to.beA( "function" )
            end
        },

        {
            name = "Writes a short correctly",
            func = function()
                local a = GetTestFile( "WriteShort", true )
                local value = 32000

                a:WriteShort( value )
                a:Close()

                local b = GetTestFile( "WriteShort" )
                expect( b:ReadShort() ).to.equal( value )
            end
        },
    }
}
