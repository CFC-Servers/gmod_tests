--- @type GLuaTest_TestGroup
return {
    groupName = "string.find",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.find ).to.beA( "function" )
            end
        },

        {
            name = "Returns the start and end positions of the first match",
            func = function()
                local startPos, endPos = string.find( "Hello World", "World" )
                expect( startPos ).to.equal( 7 )
                expect( endPos ).to.equal( 11 )
            end
        },

        {
            name = "Returns nil when the needle is not found",
            func = function()
                local startPos = string.find( "Hello World", "xyz" )
                expect( startPos ).to.beNil()
            end
        },

        {
            name = "Treats the needle as a Lua pattern by default",
            func = function()
                local startPos, endPos = string.find( "abc123", "%d+" )
                expect( startPos ).to.equal( 4 )
                expect( endPos ).to.equal( 6 )

                local dotStart = string.find( "abc", "." )
                expect( dotStart ).to.equal( 1 )
            end
        },

        {
            name = "Returns captures after the positions",
            func = function()
                local startPos, endPos, capture = string.find( "key=value", "(%a+)=" )
                expect( startPos ).to.equal( 1 )
                expect( endPos ).to.equal( 4 )
                expect( capture ).to.equal( "key" )
            end
        },

        {
            name = "Starts searching from the startPos argument",
            func = function()
                local startPos, endPos = string.find( "abab", "ab", 2 )
                expect( startPos ).to.equal( 3 )
                expect( endPos ).to.equal( 4 )
            end
        },

        {
            name = "Counts from the end of the string for negative startPos",
            func = function()
                local startPos = string.find( "abab", "ab", -2 )
                expect( startPos ).to.equal( 3 )
            end
        },

        {
            name = "Returns nil when startPos is past any match",
            func = function()
                local startPos = string.find( "abc", "a", 2 )
                expect( startPos ).to.beNil()
            end
        },

        {
            name = "Disables patterns when noPatterns is true",
            func = function()
                local startPos, endPos = string.find( "a.c", ".", 1, true )
                expect( startPos ).to.equal( 2 )
                expect( endPos ).to.equal( 2 )

                local noMagic = string.find( "abc", ".", 1, true )
                expect( noMagic ).to.beNil()
            end
        },

        {
            name = "Matches an empty pattern at the first position",
            func = function()
                local startPos, endPos = string.find( "abc", "" )
                expect( startPos ).to.equal( 1 )
                expect( endPos ).to.equal( 0 )
            end
        },

        {
            name = "Clamps startPos past the end to just after the string",
            func = function()
                local startPos, endPos = string.find( "abc", "", 10 )
                expect( startPos ).to.equal( 4 )
                expect( endPos ).to.equal( 3 )
            end
        },

        {
            name = "Respects anchored patterns",
            func = function()
                local anchored = string.find( "abc", "^b" )
                expect( anchored ).to.beNil()

                local atStart = string.find( "abc", "^a" )
                expect( atStart ).to.equal( 1 )
            end
        },

        {
            name = "Errors on malformed patterns",
            func = function()
                expect( string.find, "abc", "[" ).to.errWith( "malformed pattern (missing ']')" )
            end
        }
    }
}
