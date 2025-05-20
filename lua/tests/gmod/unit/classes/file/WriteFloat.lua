--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteFloat",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteFloat ).to.beA( "function" )
            end
        }
    }
}
