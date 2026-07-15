--- @type GLuaTest_TestGroup
return {
    groupName = "string.StripExtension",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.StripExtension ).to.beA( "function" )
            end
        },

        {
            name = "Removes the extension from the path",
            func = function()
                local stripped = string.StripExtension( "folder/file.lua" )
                expect( stripped ).to.equal( "folder/file" )
            end
        },

        {
            name = "Returns the path unchanged when it has no extension",
            func = function()
                local unchanged = string.StripExtension( "folder/file" )
                expect( unchanged ).to.equal( "folder/file" )
            end
        },

        {
            name = "Removes only the last extension for multiple dots",
            func = function()
                local stripped = string.StripExtension( "a/b.tar.gz" )
                expect( stripped ).to.equal( "a/b.tar" )
            end
        },

        {
            name = "Strips a leading-dot filename to an empty string",
            func = function()
                local emptied = string.StripExtension( ".gitignore" )
                expect( emptied ).to.equal( "" )
            end
        },

        {
            name = "Ignores dots in the directory name",
            func = function()
                local unchanged = string.StripExtension( "a.b/c" )
                expect( unchanged ).to.equal( "a.b/c" )
            end
        }
    }
}
