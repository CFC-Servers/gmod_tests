return {
    groupName = "File:ReadULong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.ReadULong ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "WriteULong" )

                local val = a:ReadULong()

                expect( val ).to.equal( 4200000000 )
            end
        },
    }
}
