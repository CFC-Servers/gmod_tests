--- @type GLuaTest_TestGroup
return {
    groupName = "string.Trim",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Trim ).to.beA( "function" )
            end
        },

        {
            name = "Removes leading and trailing whitespace by default",
            func = function()
                local trimmed = string.Trim( "  hi  " )
                expect( trimmed ).to.equal( "hi" )

                local mixedWhitespace = string.Trim( "\t\n hi \r\n" )
                expect( mixedWhitespace ).to.equal( "hi" )
            end
        },

        {
            name = "Keeps whitespace inside the string",
            func = function()
                local trimmed = string.Trim( "  a b  " )
                expect( trimmed ).to.equal( "a b" )
            end
        },

        {
            name = "Returns untouched strings unchanged",
            func = function()
                local unchanged = string.Trim( "hi" )
                expect( unchanged ).to.equal( "hi" )

                local empty = string.Trim( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Trims to an empty string when everything is whitespace",
            func = function()
                local emptied = string.Trim( "   " )
                expect( emptied ).to.equal( "" )
            end
        },

        {
            name = "Removes the given character instead of whitespace",
            func = function()
                local trimmed = string.Trim( "xxhixx", "x" )
                expect( trimmed ).to.equal( "hi" )
            end
        },

        {
            name = "Escapes pattern magic in the character argument",
            func = function()
                local literalDot = string.Trim( "..hi..", "." )
                expect( literalDot ).to.equal( "hi" )

                local classNotApplied = string.Trim( "aahiaa", "[ab]" )
                expect( classNotApplied ).to.equal( "aahiaa" )
            end
        },

        {
            name = "Trims a multi-character argument from both ends",
            func = function()
                local trimmed = string.Trim( "you cant be serious ,you", "you" )
                expect( trimmed ).to.equal( " cant be serious ," )
            end
        },

        {
            name = "Leaves the string untouched when a multi-character argument is missing from either end",
            func = function()
                local missingStart = string.Trim( "hi you", "you" )
                expect( missingStart ).to.equal( "hi you" )

                local missingEnd = string.Trim( "you hi", "you" )
                expect( missingEnd ).to.equal( "you hi" )
            end
        },

        {
            name = "Repeats only the last character of a multi-character argument",
            func = function()
                local onlyLastRepeats = string.Trim( "youuu hi youuu", "you" )
                expect( onlyLastRepeats ).to.equal( " hi " )

                local wholeUnitNotRepeated = string.Trim( "youyou hi youyou", "you" )
                expect( wholeUnitNotRepeated ).to.equal( "you hi you" )
            end
        }
    }
}
