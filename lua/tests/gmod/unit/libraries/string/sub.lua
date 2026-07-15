--- @type GLuaTest_TestGroup
return {
    groupName = "string.sub",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.sub ).to.beA( "function" )
            end
        },

        {
            name = "Extracts a range with positive indices",
            func = function()
                local hello = string.sub( "Hello World", 1, 5 )
                expect( hello ).to.equal( "Hello" )

                local single = string.sub( "Hello", 2, 2 )
                expect( single ).to.equal( "e" )

                local full = string.sub( "Hello", 1, 5 )
                expect( full ).to.equal( "Hello" )
            end
        },

        {
            name = "Returns the rest of the string when EndPos is omitted",
            func = function()
                local rest = string.sub( "Hello World", 7 )
                expect( rest ).to.equal( "World" )

                local all = string.sub( "Hello", 1 )
                expect( all ).to.equal( "Hello" )
            end
        },

        {
            name = "Counts from the end of the string for negative indices",
            func = function()
                local lastThree = string.sub( "Hello", -3 )
                expect( lastThree ).to.equal( "llo" )

                local trimmed = string.sub( "Hello", 2, -2 )
                expect( trimmed ).to.equal( "ell" )

                local lastTwo = string.sub( "Hello", -2, -1 )
                expect( lastTwo ).to.equal( "lo" )
            end
        },

        {
            name = "Clamps out-of-range indices to the string bounds",
            func = function()
                local fromFarBack = string.sub( "Hello", -100 )
                expect( fromFarBack ).to.equal( "Hello" )

                local toFarForward = string.sub( "Hello", 3, 100 )
                expect( toFarForward ).to.equal( "llo" )

                local fromZero = string.sub( "Hello", 0 )
                expect( fromZero ).to.equal( "Hello" )
            end
        },

        {
            name = "Returns an empty string when the range selects nothing",
            func = function()
                local inverted = string.sub( "Hello", 3, 2 )
                expect( inverted ).to.equal( "" )

                local pastEnd = string.sub( "Hello", 6 )
                expect( pastEnd ).to.equal( "" )

                local fromEmpty = string.sub( "", 1 )
                expect( fromEmpty ).to.equal( "" )
            end
        },

        {
            name = "Coerces number subjects and numeric-string indices",
            func = function()
                local digits = string.sub( 12345, 2, 3 )
                expect( digits ).to.equal( "23" )

                local viaStringIndices = string.sub( "Hello", "2", "3" )
                expect( viaStringIndices ).to.equal( "el" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.sub, nil, 1 ).to.errWith( "bad argument #1 to '?' (string expected, got nil)" )
            end
        }
    }
}
