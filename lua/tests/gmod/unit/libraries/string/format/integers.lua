--- @type GLuaTest_TestGroup
return {
    groupName = "string.format: integer specifiers",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.format ).to.beA( "function" )
            end
        },

        {
            name = "Formats signed integers with d and i",
            func = function()
                local positive = string.format( "%d", 42 )
                expect( positive ).to.equal( "42" )

                local negative = string.format( "%d", -42 )
                expect( negative ).to.equal( "-42" )

                local viaI = string.format( "%i", 42 )
                expect( viaI ).to.equal( "42" )

                local zero = string.format( "%d", 0 )
                expect( zero ).to.equal( "0" )
            end
        },

        {
            name = "Truncates fractional numbers for integer specifiers",
            func = function()
                local truncated = string.format( "%d", 41.9 )
                expect( truncated ).to.equal( "41" )
            end
        },

        {
            name = "Formats unsigned integers with u",
            func = function()
                local positive = string.format( "%u", 42 )
                expect( positive ).to.equal( "42" )
            end
        },

        {
            name = "Wraps negative numbers for the unsigned specifier",
            func = function()
                local wrapped = string.format( "%u", -1 )
                expect( wrapped ).to.equal( "18446744073709551615" )
            end
        },

        {
            name = "Formats octal with o",
            func = function()
                local octal = string.format( "%o", 8 )
                expect( octal ).to.equal( "10" )

                local zero = string.format( "%o", 0 )
                expect( zero ).to.equal( "0" )
            end
        },

        {
            name = "Formats hexadecimal with x and X",
            func = function()
                local lower = string.format( "%x", 255 )
                expect( lower ).to.equal( "ff" )

                local upper = string.format( "%X", 255 )
                expect( upper ).to.equal( "FF" )

                local zero = string.format( "%x", 0 )
                expect( zero ).to.equal( "0" )
            end
        },

        {
            name = "Formats characters from their byte value with c",
            func = function()
                local letter = string.format( "%c", 65 )
                expect( letter ).to.equal( "A" )
            end
        },

        {
            name = "Coerces numeric strings for integer specifiers",
            func = function()
                local coerced = string.format( "%d", "42" )
                expect( coerced ).to.equal( "42" )
            end
        },

        {
            name = "Errors when given a non-number for an integer specifier",
            func = function()
                expect( string.format, "%d", "abc" ).to.errWith( "bad argument #2 to '?' (number expected, got string)" )
            end
        },

        {
            name = "Errors when the argument for a specifier is missing",
            func = function()
                expect( string.format, "%d" ).to.errWith( "bad argument #2 to '?' (no value)" )
            end
        }
    }
}
