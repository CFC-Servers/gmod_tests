return {
    groupName = "File:ReadLong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadLong ).to.beA( "function" )
            end
        },

        {
            name = "Reads the long correctly",
            func = function()
                local a = GetTestFile( "WriteLong" )

                local val = a:ReadLong()

                expect( val ).to.equal( 2100000000 )
            end
        },
    }
}
