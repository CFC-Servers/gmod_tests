--- @type GLuaTest_TestGroup
return {
    groupName = "File:WriteLong",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.WriteLong ).to.beA( "function" )
            end
        }
    }
}
