--- @type GLuaTest_TestGroup
return {
    groupName = "string.lower",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.lower ).to.beA( "function" )
            end
        },

        {
            name = "Lowercases all English letters",
            func = function()
                local fromUpper = string.lower( "ABCDEFG" )
                expect( fromUpper ).to.equal( "abcdefg" )

                local fromMixed = string.lower( "AbCdefG" )
                expect( fromMixed ).to.equal( "abcdefg" )

                local alreadyLower = string.lower( "abcdefg" )
                expect( alreadyLower ).to.equal( "abcdefg" )
            end
        },

        {
            name = "Leaves digits and punctuation unchanged",
            func = function()
                local digits = string.lower( "1234567890" )
                expect( digits ).to.equal( "1234567890" )

                local punctuation = string.lower( "!@#$%^&*()-+{}[]" )
                expect( punctuation ).to.equal( "!@#$%^&*()-+{}[]" )
            end
        },

        {
            -- https://github.com/Facepunch/garrysmod-issues/issues/2988
            name = "Fails for non-English UTF-8 letters",
            func = function()
                local unchanged = string.lower( "ÜÄÖ" )
                expect( unchanged ).to.equal( "ÜÄÖ" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.lower( 123 )
                expect( digits ).to.equal( "123" )
            end
        },

        {
            name = "Errors when given nil instead of a string",
            func = function()
                expect( string.lower, nil ).to.errWith( "bad argument #1 to '?' (string expected, got no value)" )
            end
        }
    }
}
