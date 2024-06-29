return {
    groupName = "File:Size",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.Size ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "Write" )

                local size = a:Size()

                expect( size ).to.equal( 24 )
            end
        },

        {
            name = "Have the expect behavior",
            func = function()
                local a = GetTestFile( "Size", true )
                a:Write( "Hello World" )

                local size = a:Size()

                expect( size ).to.equal( 0 ) -- Undocumented: (Verify again)BUG: All Read* and Size functions will fail on a file that isn't in read mode.
            end
        },
    }
}
