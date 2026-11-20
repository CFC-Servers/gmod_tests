--- @type GLuaTest_TestGroup
return {
    groupName = "string.Explode",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Explode ).to.beA( "function" )
            end
        },

        {
            name = "Splits the string at every separator",
            func = function()
                local parts = string.Explode( ",", "a,b,c" )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )
            end
        },

        {
            name = "Returns the whole string when the separator is absent",
            func = function()
                local parts = string.Explode( ",", "abc" )
                expect( parts ).to.deepEqual( { "abc" } )
            end
        },

        {
            name = "Produces empty entries for leading, adjacent, and trailing separators",
            func = function()
                local trailing = string.Explode( ",", "a,b," )
                expect( trailing ).to.deepEqual( { "a", "b", "" } )

                local adjacent = string.Explode( ",", "a,,b" )
                expect( adjacent ).to.deepEqual( { "a", "", "b" } )

                local leading = string.Explode( ",", ",a" )
                expect( leading ).to.deepEqual( { "", "a" } )
            end
        },

        {
            name = "Splits into single characters for an empty separator",
            func = function()
                local chars = string.Explode( "", "abc" )
                expect( chars ).to.deepEqual( { "a", "b", "c" } )
            end
        },

        {
            name = "Returns one empty entry for an empty string",
            func = function()
                local parts = string.Explode( ",", "" )
                expect( parts ).to.deepEqual( { "" } )
            end
        },

        {
            name = "Returns an empty table for an empty string and empty separator",
            func = function()
                local parts = string.Explode( "", "" )
                expect( parts ).to.deepEqual( {} )
            end
        },

        {
            name = "Treats the separator as a Lua pattern when withpattern is true",
            func = function()
                local parts = string.Explode( "%s+", "a  b\tc", true )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )
            end
        },

        {
            name = "Treats pattern characters literally when withpattern is false",
            func = function()
                local parts = string.Explode( ".", "a.b.c" )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )
            end
        }
    }
}
