--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteUInt64",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteUInt64 ).to.beA( "function" )
            end
        }
    }
}
