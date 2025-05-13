--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteUShort",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteUShort ).to.beA( "function" )
            end
        }
    }
}
