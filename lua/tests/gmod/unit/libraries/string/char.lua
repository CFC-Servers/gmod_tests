--- @type GLuaTest_TestGroup
return {
    groupName = "string.char",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.char ).to.beA( "function" )
            end
        },

        {
            name = "Converts ASCII values to their characters",
            func = function()
                local single = string.char( 65 )
                expect( single ).to.equal( "A" )

                local word = string.char( 72, 105 )
                expect( word ).to.equal( "Hi" )
            end
        },

        {
            name = "Returns an empty string when given no arguments",
            func = function()
                local empty = string.char()
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Produces strings containing embedded NUL bytes",
            func = function()
                local withNul = string.char( 65, 0, 66 )
                expect( #withNul ).to.equal( 3 )
            end
        },

        {
            name = "Coerces numeric strings to numbers",
            func = function()
                local coerced = string.char( "65" )
                expect( coerced ).to.equal( "A" )
            end
        },

        {
            name = "Accepts the boundary byte values 0 and 255",
            func = function()
                local lowest = string.char( 0 )
                expect( lowest ).to.equal( "\0" )

                local highest = string.char( 255 )
                expect( highest ).to.equal( "\255" )
            end
        },

        {
            name = "Errors on byte values outside the 0-255 range",
            func = function()
                expect( string.char, 256 ).to.errWith( "bad argument #1 to '?' (invalid value)" )
                expect( string.char, -1 ).to.errWith( "bad argument #1 to '?' (invalid value)" )
            end
        },

        {
            name = "Round-trips with string.byte",
            func = function()
                local roundTripped = string.char( string.byte( "GMod", 1, 4 ) )
                expect( roundTripped ).to.equal( "GMod" )
            end
        }
    }
}
