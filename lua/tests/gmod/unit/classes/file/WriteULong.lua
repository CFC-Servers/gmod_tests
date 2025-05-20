--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteULong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteULong ).to.beA( "function" )
            end
        }
    }
}
