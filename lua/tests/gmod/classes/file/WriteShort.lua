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
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteShort", true )
                a:WriteShort( 32000 )
                a:Close()

                local b = GetTestFile( "WriteShort" )

                expect( b:ReadShort() ).to.equal( 32000 )
            end
        },
    }
}
