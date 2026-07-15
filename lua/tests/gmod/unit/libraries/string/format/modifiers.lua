--- @type GLuaTest_TestGroup
return {
    groupName = "string.format: width, precision, and flag modifiers",

    cases = {
        {
            name = "Pads to the field width with spaces",
            func = function()
                local rightAligned = string.format( "%5d", 42 )
                expect( rightAligned ).to.equal( "   42" )

                local stringWidth = string.format( "%5s", "ab" )
                expect( stringWidth ).to.equal( "   ab" )
            end
        },

        {
            name = "Left-aligns with the minus flag",
            func = function()
                local leftAligned = string.format( "%-5d|", 42 )
                expect( leftAligned ).to.equal( "42   |" )

                local leftString = string.format( "%-5s|", "ab" )
                expect( leftString ).to.equal( "ab   |" )
            end
        },

        {
            name = "Zero-pads numbers with the zero flag",
            func = function()
                local padded = string.format( "%05d", 42 )
                expect( padded ).to.equal( "00042" )

                local negativePadded = string.format( "%05d", -42 )
                expect( negativePadded ).to.equal( "-0042" )
            end
        },

        {
            name = "Forces a sign with the plus flag",
            func = function()
                local positive = string.format( "%+d", 42 )
                expect( positive ).to.equal( "+42" )

                local negative = string.format( "%+d", -42 )
                expect( negative ).to.equal( "-42" )
            end
        },

        {
            name = "Reserves a space for the sign with the space flag",
            func = function()
                local spaced = string.format( "% d", 42 )
                expect( spaced ).to.equal( " 42" )
            end
        },

        {
            name = "Prefixes alternate forms with the hash flag",
            func = function()
                local hex = string.format( "%#x", 255 )
                expect( hex ).to.equal( "0xff" )

                local octal = string.format( "%#o", 8 )
                expect( octal ).to.equal( "010" )
            end
        },

        {
            name = "Limits and rounds float digits with a precision",
            func = function()
                local twoDigits = string.format( "%.2f", 3.14159 )
                expect( twoDigits ).to.equal( "3.14" )

                local roundedHalf = string.format( "%.1f", 0.25 )
                expect( roundedHalf ).to.equal( "0.3" )

                local noDigits = string.format( "%.0f", 3.7 )
                expect( noDigits ).to.equal( "4" )
            end
        },

        {
            name = "Truncates strings with a precision",
            func = function()
                local truncated = string.format( "%.3s", "abcdef" )
                expect( truncated ).to.equal( "abc" )
            end
        },

        {
            name = "Zero-pads integers with a precision",
            func = function()
                local padded = string.format( "%.5d", 42 )
                expect( padded ).to.equal( "00042" )
            end
        },

        {
            name = "Combines width and precision",
            func = function()
                local combined = string.format( "%8.2f", 3.14159 )
                expect( combined ).to.equal( "    3.14" )

                local leftCombined = string.format( "%-8.2f|", 3.14159 )
                expect( leftCombined ).to.equal( "3.14    |" )
            end
        },

        {
            name = "Does not support star widths from C printf",
            func = function()
                expect( string.format, "%*d", 5, 42 ).to.errWith( "invalid option '%*' to 'format'" )
            end
        }
    }
}
