return {
    groupName = "File:WriteULong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.WriteULong ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteULong", true )
                a:WriteULong( 4100000000 )
                a:Close()

                local b = GetTestFile( "WriteULong" )

                expect( b:ReadULong() ).to.equal( 4100000000 )
            end
        },
    }
}
