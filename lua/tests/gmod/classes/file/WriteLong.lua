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
            name = "Writes a long correctly",
            func = function()
                local a = GetTestFile( "WriteLong", true )
                local value = 2100000000

                a:WriteLong( value )
                a:Close()

                local b = GetTestFile( "WriteLong" )
                expect( b:ReadLong() ).to.equal( value )
            end
        },
    }
}
