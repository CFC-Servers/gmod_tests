--- @type GLuaTest_TestGroup
return {
    groupName = "string.TrimLeft",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.TrimLeft ).to.beA( "function" )
            end
        },

        {
            name = "Removes only leading whitespace by default",
            func = function()
                local trimmed = string.TrimLeft( "  hi  " )
                expect( trimmed ).to.equal( "hi  " )
            end
        },

        {
            name = "Removes the given character instead of whitespace",
            func = function()
                local trimmed = string.TrimLeft( "xxhixx", "x" )
                expect( trimmed ).to.equal( "hixx" )
            end
        },

        {
            name = "Returns untouched strings unchanged",
            func = function()
                local unchanged = string.TrimLeft( "hi  " )
                expect( unchanged ).to.equal( "hi  " )

                local empty = string.TrimLeft( "" )
                expect( empty ).to.equal( "" )
            end
        }
    }
}
