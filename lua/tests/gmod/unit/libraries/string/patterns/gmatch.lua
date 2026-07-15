--- @type GLuaTest_TestGroup
return {
    groupName = "string.gmatch",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.gmatch ).to.beA( "function" )
            end
        },

        {
            name = "Returns an iterator over every match",
            func = function()
                local iter = string.gmatch( "one two three", "%a+" )

                local first = iter()
                expect( first ).to.equal( "one" )

                local second = iter()
                expect( second ).to.equal( "two" )

                local third = iter()
                expect( third ).to.equal( "three" )
            end
        },

        {
            name = "Returns nil once the matches are exhausted",
            func = function()
                local iter = string.gmatch( "one", "%a+" )

                local first = iter()
                expect( first ).to.equal( "one" )

                local finished = iter()
                expect( finished ).to.beNil()
            end
        },

        {
            name = "Returns nil immediately when nothing matches",
            func = function()
                local iter = string.gmatch( "abc", "%d+" )

                local result = iter()
                expect( result ).to.beNil()
            end
        },

        {
            name = "Returns captures instead of the whole match when present",
            func = function()
                local iter = string.gmatch( "a=1, b=2", "(%a+)=(%d+)" )

                local key, value = iter()
                expect( key ).to.equal( "a" )
                expect( value ).to.equal( "1" )

                local key2, value2 = iter()
                expect( key2 ).to.equal( "b" )
                expect( value2 ).to.equal( "2" )
            end
        },

        {
            name = "Does not overlap matches",
            func = function()
                local iter = string.gmatch( "aaaa", "aa" )

                local first = iter()
                expect( first ).to.equal( "aa" )

                local second = iter()
                expect( second ).to.equal( "aa" )

                local finished = iter()
                expect( finished ).to.beNil()
            end
        },

        {
            name = "Matches an empty pattern once per position plus one",
            func = function()
                local iter = string.gmatch( "ab", "x*" )

                local first = iter()
                expect( first ).to.equal( "" )

                local second = iter()
                expect( second ).to.equal( "" )

                local third = iter()
                expect( third ).to.equal( "" )

                local finished = iter()
                expect( finished ).to.beNil()
            end
        },

        {
            name = "Never matches anchored patterns",
            func = function()
                local iter = string.gmatch( "aaa", "^a" )

                local first = iter()
                expect( first ).to.beNil()
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local iter = string.gmatch( 123, "%d" )

                local first = iter()
                expect( first ).to.equal( "1" )
            end
        }
    }
}
