return {
    groupName = "File:WriteUShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteUShort ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteUShort", true )
                a:WriteUShort( 63000 )
                a:Close()

                local b = GetTestFile( "WriteUShort" )

                expect( b:ReadUShort() ).to.equal( 63000 )
            end
        },
    }
}
