--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteShort ).to.beA( "function" )
            end
        }
    }
}
