return {
    groupName = "File:WriteLong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteLong ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteLong", true )
                a:WriteLong( 2000000000 )
                a:Close()

                local b = GetTestFile( "WriteLong" )

                expect( b:ReadLong() ).to.equal( 2000000000 )
            end
        },
    }
}
