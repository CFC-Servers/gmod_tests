--- @type GLuaTest_TestGroup
return {
    groupName = "string.upper",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.upper ).to.beA( "function" )
            end
        },

        {
            name = "Uppercases all English letters",
            func = function()
                local fromLower = string.upper( "abcdefg" )
                expect( fromLower ).to.equal( "ABCDEFG" )

                local fromMixed = string.upper( "AbCdefG" )
                expect( fromMixed ).to.equal( "ABCDEFG" )

                local alreadyUpper = string.upper( "ABCDEFG" )
                expect( alreadyUpper ).to.equal( "ABCDEFG" )
            end
        },

        {
            name = "Leaves digits and punctuation unchanged",
            func = function()
                local digits = string.upper( "1234567890" )
                expect( digits ).to.equal( "1234567890" )

                local punctuation = string.upper( "!@#$%^&*()-+{}[]" )
                expect( punctuation ).to.equal( "!@#$%^&*()-+{}[]" )
            end
        },

        {
            -- https://github.com/Facepunch/garrysmod-issues/issues/2988
            name = "Fails for non-English UTF-8 letters",
            func = function()
                local unchanged = string.upper( "üäö" )
                expect( unchanged ).to.equal( "üäö" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.upper( 123 )
                expect( digits ).to.equal( "123" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.upper, nil ).to.errWith( "bad argument #1 to '?' (string expected, got no value)" )
            end
        }
    }
}
