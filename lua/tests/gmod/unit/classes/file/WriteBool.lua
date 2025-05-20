--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteBool",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteBool ).to.beA( "function" )
            end
        }
    }
}
