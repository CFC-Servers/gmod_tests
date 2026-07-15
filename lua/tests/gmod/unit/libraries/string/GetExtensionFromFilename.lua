--- @type GLuaTest_TestGroup
return {
    groupName = "string.GetExtensionFromFilename",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.GetExtensionFromFilename ).to.beA( "function" )
            end
        },

        {
            name = "Returns the extension without the dot",
            func = function()
                local extension = string.GetExtensionFromFilename( "folder/file.lua" )
                expect( extension ).to.equal( "lua" )

                local bareFile = string.GetExtensionFromFilename( "file.txt" )
                expect( bareFile ).to.equal( "txt" )
            end
        },

        {
            name = "Returns nil when the path has no extension",
            func = function()
                local missing = string.GetExtensionFromFilename( "folder/file" )
                expect( missing ).to.beNil()
            end
        },

        {
            name = "Returns only the last extension for multiple dots",
            func = function()
                local last = string.GetExtensionFromFilename( "a/b.tar.gz" )
                expect( last ).to.equal( "gz" )
            end
        },

        {
            name = "Treats a leading-dot filename as all extension",
            func = function()
                local dotfile = string.GetExtensionFromFilename( ".gitignore" )
                expect( dotfile ).to.equal( "gitignore" )
            end
        },

        {
            name = "Includes trailing whitespace in the extension",
            func = function()
                local padded = string.GetExtensionFromFilename( "file.lua " )
                expect( padded ).to.equal( "lua " )
            end
        },

        {
            name = "Ignores dots in the directory name",
            func = function()
                local noExtension = string.GetExtensionFromFilename( "a.b/c" )
                expect( noExtension ).to.beNil()
            end
        }
    }
}
