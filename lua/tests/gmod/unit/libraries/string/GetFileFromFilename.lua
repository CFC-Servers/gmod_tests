--- @type GLuaTest_TestGroup
return {
    groupName = "string.GetFileFromFilename",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.GetFileFromFilename ).to.beA( "function" )
            end
        },

        {
            name = "Returns the file name with its extension",
            func = function()
                local fileName = string.GetFileFromFilename( "folder/file.lua" )
                expect( fileName ).to.equal( "file.lua" )

                local nested = string.GetFileFromFilename( "a/b/c/file.txt" )
                expect( nested ).to.equal( "file.txt" )
            end
        },

        {
            name = "Returns the whole string when there is no path",
            func = function()
                local bare = string.GetFileFromFilename( "file.lua" )
                expect( bare ).to.equal( "file.lua" )
            end
        },

        {
            name = "Supports backslash separators",
            func = function()
                local fileName = string.GetFileFromFilename( "a\\b\\c.lua" )
                expect( fileName ).to.equal( "c.lua" )
            end
        },

        {
            name = "Returns an empty string for a path ending in a separator",
            func = function()
                local fromDir = string.GetFileFromFilename( "folder/" )
                expect( fromDir ).to.equal( "" )
            end
        }
    }
}
