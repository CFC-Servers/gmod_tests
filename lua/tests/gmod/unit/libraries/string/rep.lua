--- @type GLuaTest_TestGroup
return {
    groupName = "string.rep",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.rep ).to.beA( "function" )
            end
        },

        {
            name = "Repeats the string the given number of times",
            func = function()
                local tripled = string.rep( "ab", 3 )
                expect( tripled ).to.equal( "ababab" )

                local once = string.rep( "ab", 1 )
                expect( once ).to.equal( "ab" )
            end
        },

        {
            name = "Joins repetitions with the separator argument",
            func = function()
                local joined = string.rep( "ab", 3, "-" )
                expect( joined ).to.equal( "ab-ab-ab" )

                local single = string.rep( "ab", 1, "-" )
                expect( single ).to.equal( "ab" )
            end
        },

        {
            name = "Returns an empty string for zero or negative counts",
            func = function()
                local zero = string.rep( "ab", 0 )
                expect( zero ).to.equal( "" )

                local negative = string.rep( "ab", -1 )
                expect( negative ).to.equal( "" )

                local zeroWithSeparator = string.rep( "ab", 0, "-" )
                expect( zeroWithSeparator ).to.equal( "" )
            end
        },

        {
            name = "Truncates fractional repetition counts (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local aboveHalf = string.rep( "ab", 2.7 )
                expect( aboveHalf ).to.equal( "abab" )

                local belowHalf = string.rep( "ab", 2.2 )
                expect( belowHalf ).to.equal( "abab" )
            end
        },

        {
            name = "Rounds fractional repetition counts to the nearest integer (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local aboveHalf = string.rep( "ab", 2.7 )
                expect( aboveHalf ).to.equal( "ababab" )

                local belowHalf = string.rep( "ab", 2.2 )
                expect( belowHalf ).to.equal( "abab" )
            end
        },

        {
            name = "Repeats an empty string into an empty string",
            func = function()
                local empty = string.rep( "", 5 )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.rep( 12, 3 )
                expect( digits ).to.equal( "121212" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                local subject = function()
                    string.rep( nil, 2 )
                end

                expect( subject ).to.errWith( "bad argument #1 to 'rep' (string expected, got nil)" )
            end
        }
    }
}
