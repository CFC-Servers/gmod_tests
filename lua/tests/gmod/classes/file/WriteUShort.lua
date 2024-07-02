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
            name = "Writes a unsigned short correctly",
            func = function()
                local a = GetTestFile( "WriteUShort", true )
                local value = 64000

                a:WriteUShort( value )
                a:Close()

                local b = GetTestFile( "WriteUShort" )
                expect( b:ReadUShort() ).to.equal( value )
            end
        },
    }
}
