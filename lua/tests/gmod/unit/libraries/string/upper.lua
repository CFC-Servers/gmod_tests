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
                expect( string.upper( "ABCDEFG" ) ).to.equal( "ABCDEFG" )
                expect( string.upper( "AbCdefG" ) ).to.equal( "ABCDEFG" )
                expect( string.upper( "abcdefg" ) ).to.equal( "ABCDEFG" )
                expect( string.upper( "1234567890" ) ).to.equal( "1234567890" )
                expect( string.upper( "!@#$%^&*()-+{}[]" ) ).to.equal( "!@#$%^&*()-+{}[]" )
            end
        },

        {
            -- https://github.com/Facepunch/garrysmod-issues/issues/2988
            name = "Fails for non-English UTF-8 letters",
            func = function()
                expect( string.upper( "üäö" ) ).to.equal( "üäö" )
            end
        }
    }
}