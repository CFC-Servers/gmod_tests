--- @type GLuaTest_TestGroup
return {
    groupName = "string.reverse",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.reverse ).to.beA( "function" )
            end
        },

        {
            name = "Reverses ASCII strings",
            func = function()
                local reversed = string.reverse( "abcdef" )
                expect( reversed ).to.equal( "fedcba" )

                local single = string.reverse( "a" )
                expect( single ).to.equal( "a" )

                local empty = string.reverse( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.reverse( 1234 )
                expect( digits ).to.equal( "4321" )

                local notANumber = string.reverse( 0 / 0 )
                expect( notANumber ).to.equal( "nan" )
            end
        },

        {
            name = "Reverses bytes rather than UTF-8 codepoints",
            func = function()
                local mangled = string.reverse( "üäö" ) == "öäü"
                expect( mangled ).to.beFalse()
            end
        },

        {
            name = "Errors when given nil or an entity",
            func = function()
                expect( string.reverse, nil ).to.errWith( "bad argument #1 to '?' (string expected, got no value)" )
                expect( string.reverse, NULL ).to.errWith( "bad argument #1 to '?' (string expected, got userdata)" )
            end
        }
    }
}
