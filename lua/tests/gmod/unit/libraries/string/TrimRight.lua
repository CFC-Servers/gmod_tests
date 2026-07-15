--- @type GLuaTest_TestGroup
return {
    groupName = "string.TrimRight",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.TrimRight ).to.beA( "function" )
            end
        },

        {
            name = "Removes only trailing whitespace by default",
            func = function()
                local trimmed = string.TrimRight( "  hi  " )
                expect( trimmed ).to.equal( "  hi" )
            end
        },

        {
            name = "Removes the given character instead of whitespace",
            func = function()
                local trimmed = string.TrimRight( "xxhixx", "x" )
                expect( trimmed ).to.equal( "xxhi" )
            end
        },

        {
            name = "Returns untouched strings unchanged",
            func = function()
                local unchanged = string.TrimRight( "  hi" )
                expect( unchanged ).to.equal( "  hi" )

                local empty = string.TrimRight( "" )
                expect( empty ).to.equal( "" )
            end
        }
    }
}
