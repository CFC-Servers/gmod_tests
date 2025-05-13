--- @type GLuaTest_TestGroup
return {
    groupName = "File:Write",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = assert( FindMetaTable( "File" ) )
                expect( meta.Write ).to.beA( "function" )
            end
        }
    }
}
