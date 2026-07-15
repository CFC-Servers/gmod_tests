--- @type GLuaTest_TestGroup
return {
    groupName = "string.format: float specifiers",

    cases = {
        {
            name = "Formats fixed-point notation with f",
            func = function()
                local default = string.format( "%f", 1.5 )
                expect( default ).to.equal( "1.500000" )

                local negative = string.format( "%f", -1.5 )
                expect( negative ).to.equal( "-1.500000" )

                local wholeNumber = string.format( "%f", 3 )
                expect( wholeNumber ).to.equal( "3.000000" )
            end
        },

        {
            name = "Formats scientific notation with e and E",
            func = function()
                local lower = string.format( "%e", 1500 )
                expect( lower ).to.equal( "1.500000e+03" )

                local upper = string.format( "%E", 1500 )
                expect( upper ).to.equal( "1.500000E+03" )
            end
        },

        {
            name = "Picks the shorter representation with g and G",
            func = function()
                local plain = string.format( "%g", 1.5 )
                expect( plain ).to.equal( "1.5" )

                local wholeNumber = string.format( "%g", 100 )
                expect( wholeNumber ).to.equal( "100" )

                local scientific = string.format( "%g", 0.0000001 )
                expect( scientific ).to.equal( "1e-07" )

                local upper = string.format( "%G", 0.0000001 )
                expect( upper ).to.equal( "1E-07" )
            end
        },

        {
            name = "Formats hexadecimal floats with a",
            func = function()
                local hexFloat = string.format( "%a", 1.5 )
                expect( hexFloat ).to.equal( "0x1.8p+0" )
            end
        },

        {
            name = "Formats infinity as inf",
            func = function()
                local positive = string.format( "%f", math.huge )
                expect( positive ).to.equal( "inf" )

                local negative = string.format( "%f", -math.huge )
                expect( negative ).to.equal( "-inf" )
            end
        },

        {
            name = "Formats NaN as nan",
            func = function()
                local notANumber = string.format( "%f", 0 / 0 )
                expect( notANumber ).to.equal( "nan" )
            end
        },

        {
            name = "Errors when given a non-number for a float specifier",
            func = function()
                expect( string.format, "%f", "abc" ).to.errWith( "bad argument #2 to '?' (number expected, got string)" )
            end
        }
    }
}
