--- @type GLuaTest_TestGroup
return {
    groupName = "string.Comma",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Comma ).to.beA( "function" )
            end
        },

        {
            name = "Inserts a comma before every third digit",
            func = function()
                local millions = string.Comma( 1234567 )
                expect( millions ).to.equal( "1,234,567" )

                local thousands = string.Comma( 1234 )
                expect( thousands ).to.equal( "1,234" )
            end
        },

        {
            name = "Leaves numbers under one thousand unchanged",
            func = function()
                local small = string.Comma( 123 )
                expect( small ).to.equal( "123" )

                local zero = string.Comma( 0 )
                expect( zero ).to.equal( "0" )
            end
        },

        {
            name = "Handles negative numbers",
            func = function()
                local negative = string.Comma( -1234567 )
                expect( negative ).to.equal( "-1,234,567" )
            end
        },

        {
            name = "Separates only the integer part of decimal numbers",
            func = function()
                local decimal = string.Comma( 1234567.89 )
                expect( decimal ).to.equal( "1,234,567.89" )
            end
        },

        {
            name = "Uses the separator argument instead of a comma",
            func = function()
                local dotted = string.Comma( 1234567, "." )
                expect( dotted ).to.equal( "1.234.567" )
            end
        },

        {
            name = "Accepts numeric strings",
            func = function()
                local fromString = string.Comma( "1234567" )
                expect( fromString ).to.equal( "1,234,567" )
            end
        },

        {
            name = "Errors when given nil",
            func = function()
                expect( string.Comma, nil ).to.errWith( "bad argument #1 to 'gsub' (string expected, got nil)" )
            end
        }
    }
}
