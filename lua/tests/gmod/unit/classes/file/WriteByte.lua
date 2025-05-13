--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteByte",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteByte ).to.beA( "function" )
            end
        }
    }
}
