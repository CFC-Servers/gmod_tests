--- @type GLuaTest_TestGroup
return {
    groupName = "string.SetChar",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.SetChar ).to.beA( "function" )
            end
        },

        {
            name = "Replaces the character at the given index",
            func = function()
                local middle = string.SetChar( "abc", 2, "X" )
                expect( middle ).to.equal( "aXc" )

                local first = string.SetChar( "abc", 1, "X" )
                expect( first ).to.equal( "Xbc" )

                local last = string.SetChar( "abc", 3, "X" )
                expect( last ).to.equal( "abX" )
            end
        },

        {
            name = "Appends the replacement when the index is past the end of the string",
            func = function()
                local appended = string.SetChar( "abc", 10, "z" )
                expect( appended ).to.equal( "abcz" )
            end
        },

        {
            name = "Inserts multi-character replacements whole",
            func = function()
                local widened = string.SetChar( "abc", 2, "XY" )
                expect( widened ).to.equal( "aXYc" )
            end
        },

        {
            name = "Duplicates parts of the string for indices at or below zero",
            func = function()
                local doubled = string.SetChar( "abc", 0, "z" )
                expect( doubled ).to.equal( "abczabc" )

                local mangled = string.SetChar( "abc", -1, "z" )
                expect( mangled ).to.equal( "abzabc" )
            end
        }
    }
}
