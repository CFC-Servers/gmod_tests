--- @type GLuaTest_TestGroup
return {
    groupName = "string.len",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.len ).to.beA( "function" )
            end
        },

        {
            name = "Counts the characters in the string",
            func = function()
                local short = string.len( "hi" )
                expect( short ).to.equal( 2 )

                local longer = string.len( "drakehawke" )
                expect( longer ).to.equal( 10 )

                local empty = string.len( "" )
                expect( empty ).to.equal( 0 )
            end
        },

        {
            name = "Matches the length operator",
            func = function()
                local viaLen = string.len( "test" )
                expect( viaLen ).to.equal( #"test" )
            end
        },

        {
            name = "Counts bytes rather than UTF-8 codepoints",
            func = function()
                local bytes = string.len( "é" )
                expect( bytes ).to.equal( 2 )
            end
        },

        {
            name = "Counts embedded NUL bytes",
            func = function()
                local withNul = string.len( "a\0b" )
                expect( withNul ).to.equal( 3 )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.len( 12345 )
                expect( digits ).to.equal( 5 )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.len, nil ).to.errWith( "bad argument #1 to '?' (string expected, got nil)" )
            end
        }
    }
}
