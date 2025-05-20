--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteDouble",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteDouble ).to.beA( "function" )
            end
        }
    }
}
