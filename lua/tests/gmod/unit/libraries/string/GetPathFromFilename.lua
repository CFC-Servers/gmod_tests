--- @type GLuaTest_TestGroup
return {
    groupName = "string.GetPathFromFilename",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.GetPathFromFilename ).to.beA( "function" )
            end
        },

        {
            name = "Returns the path including the trailing separator",
            func = function()
                local path = string.GetPathFromFilename( "folder/file.lua" )
                expect( path ).to.equal( "folder/" )

                local nested = string.GetPathFromFilename( "a/b/c/file.txt" )
                expect( nested ).to.equal( "a/b/c/" )
            end
        },

        {
            name = "Returns an empty string when there is no path",
            func = function()
                local missing = string.GetPathFromFilename( "file.lua" )
                expect( missing ).to.equal( "" )
            end
        },

        {
            name = "Supports backslash separators",
            func = function()
                local path = string.GetPathFromFilename( "a\\b\\c.lua" )
                expect( path ).to.equal( "a\\b\\" )
            end
        }
    }
}
