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
            name = "Writes a unsigned long correctly",
            func = function()
                local a = GetTestFile( "WriteULong", true )
                local value = 4200000000

                a:WriteULong( value )
                a:Close()

                local b = GetTestFile( "WriteULong" )
                expect( b:ReadULong() ).to.equal( value )
            end
        },
    }
}
