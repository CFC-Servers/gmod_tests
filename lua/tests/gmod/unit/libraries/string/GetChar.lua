--- @type GLuaTest_TestGroup
return {
    groupName = "string.GetChar",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.GetChar ).to.beA( "function" )
            end
        },

        {
            name = "Returns the character at the given index",
            func = function()
                local second = string.GetChar( "abc", 2 )
                expect( second ).to.equal( "b" )

                local first = string.GetChar( "abc", 1 )
                expect( first ).to.equal( "a" )
            end
        },

        {
            name = "Counts from the end of the string for negative indices",
            func = function()
                local last = string.GetChar( "abc", -1 )
                expect( last ).to.equal( "c" )
            end
        },

        {
            name = "Returns an empty string for out-of-range indices",
            func = function()
                local pastEnd = string.GetChar( "abc", 10 )
                expect( pastEnd ).to.equal( "" )

                local atZero = string.GetChar( "abc", 0 )
                expect( atZero ).to.equal( "" )
            end
        },

        {
            name = "Behaves identically to a single-character string.sub",
            func = function()
                local viaGetChar = string.GetChar( "Hello", 3 )
                local viaSub = string.sub( "Hello", 3, 3 )
                expect( viaGetChar ).to.equal( viaSub )
            end
        }
    }
}
