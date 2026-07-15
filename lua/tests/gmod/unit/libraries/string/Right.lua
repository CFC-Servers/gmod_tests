--- @type GLuaTest_TestGroup
return {
    groupName = "string.Right",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Right ).to.beA( "function" )
            end
        },

        {
            name = "Returns the rightmost characters of the string",
            func = function()
                local world = string.Right( "Hello World", 5 )
                expect( world ).to.equal( "World" )

                local last = string.Right( "abc", 1 )
                expect( last ).to.equal( "c" )
            end
        },

        {
            name = "Returns the whole string when the count exceeds its length",
            func = function()
                local whole = string.Right( "abc", 10 )
                expect( whole ).to.equal( "abc" )
            end
        },

        {
            name = "Counts from the start of the string for negative counts",
            func = function()
                local allButFirst = string.Right( "abcdef", -2 )
                expect( allButFirst ).to.equal( "bcdef" )
            end
        },

        {
            name = "Returns an empty string for empty input",
            func = function()
                local fromEmpty = string.Right( "", 5 )
                expect( fromEmpty ).to.equal( "" )
            end
        },

        {
            name = "Returns the whole string for a zero count",
            func = function()
                local whole = string.Right( "abcdef", 0 )
                expect( whole ).to.equal( "abcdef" )
            end
        },

        {
            name = "Errors when the count is nil",
            func = function()
                expect( string.Right, "abc", nil ).to.errWith( "attempt to perform arithmetic on local 'num' (a nil value)" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.Right, nil, 2 ).to.errWith( "bad argument #1 to '?' (string expected, got nil)" )
            end
        }
    }
}
