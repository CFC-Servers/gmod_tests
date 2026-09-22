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
            name = "Truncates fractional numbers toward zero for integer specifiers (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local truncated = string.format( "%d", 41.9 )
                expect( truncated ).to.equal( "41" )

                local negative = string.format( "%d", -41.9 )
                expect( negative ).to.equal( "-41" )

                local halfway = string.format( "%d", 41.5 )
                expect( halfway ).to.equal( "41" )

                local negativeHalfway = string.format( "%d", -41.5 )
                expect( negativeHalfway ).to.equal( "-41" )
            end
        },

        {
            name = "Rounds fractional numbers to the nearest integer for integer specifiers (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local rounded = string.format( "%d", 41.9 )
                expect( rounded ).to.equal( "42" )

                local negative = string.format( "%d", -41.9 )
                expect( negative ).to.equal( "-42" )
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
            name = "Wraps negative numbers to 64 bits for unsigned specifiers (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local unsigned = string.format( "%u", -1 )
                expect( unsigned ).to.equal( "18446744073709551615" )

                local hex = string.format( "%x", -1 )
                expect( hex ).to.equal( "ffffffffffffffff" )

                local octal = string.format( "%o", -1 )
                expect( octal ).to.equal( "1777777777777777777777" )
            end
        },

        {
            name = "Wraps negative numbers to 32 bits for unsigned specifiers (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local unsigned = string.format( "%u", -1 )
                expect( unsigned ).to.equal( "4294967295" )

                local hex = string.format( "%x", -1 )
                expect( hex ).to.equal( "ffffffff" )

                local octal = string.format( "%o", -1 )
                expect( octal ).to.equal( "37777777777" )
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
                local subject = function()
                    string.format( "%d", "abc" )
                end

                expect( subject ).to.errWith( "bad argument #2 to 'format' (number expected, got string)" )
            end
        },

        {
            name = "Errors when the argument for a specifier is missing",
            func = function()
                local subject = function()
                    string.format( "%d" )
                end

                expect( subject ).to.errWith( "bad argument #2 to 'format' (no value)" )
            end
        }
    }
}
