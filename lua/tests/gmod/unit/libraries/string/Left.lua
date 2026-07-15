--- @type GLuaTest_TestGroup
return {
    groupName = "string.Left",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Left ).to.beA( "function" )
            end
        },

        {
            name = "Returns the leftmost characters of the string",
            func = function()
                local hello = string.Left( "Hello World", 5 )
                expect( hello ).to.equal( "Hello" )

                local first = string.Left( "abc", 1 )
                expect( first ).to.equal( "a" )
            end
        },

        {
            name = "Returns the whole string when the count exceeds its length",
            func = function()
                local whole = string.Left( "abc", 10 )
                expect( whole ).to.equal( "abc" )
            end
        },

        {
            name = "Returns an empty string for a zero count or empty input",
            func = function()
                local none = string.Left( "abc", 0 )
                expect( none ).to.equal( "" )

                local fromEmpty = string.Left( "", 5 )
                expect( fromEmpty ).to.equal( "" )
            end
        },

        {
            name = "Counts from the end of the string for negative counts",
            func = function()
                local allButLast = string.Left( "abcdef", -2 )
                expect( allButLast ).to.equal( "abcde" )
            end
        },

        {
            name = "Returns the whole string for a nil count",
            func = function()
                local whole = string.Left( "abc", nil )
                expect( whole ).to.equal( "abc" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.Left, nil, 2 ).to.errWith( "bad argument #1 to '?' (string expected, got nil)" )
            end
        }
    }
}
