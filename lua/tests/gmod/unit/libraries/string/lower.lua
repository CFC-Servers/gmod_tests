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
                expect( string.lower( "ABCDEFG" ) ).to.equal( "abcdefg" )
                expect( string.lower( "AbCdefG" ) ).to.equal( "abcdefg" )
                expect( string.lower( "abcdefg" ) ).to.equal( "abcdefg" )
                expect( string.lower( "1234567890" ) ).to.equal( "1234567890" )
                expect( string.lower( "!@#$%^&*()-+{}[]" ) ).to.equal( "!@#$%^&*()-+{}[]" )
            end
        },

        {
            -- https://github.com/Facepunch/garrysmod-issues/issues/2988
            name = "Fails for non-English UTF-8 letters",
            func = function()
                expect( string.lower( "ÜÄÖ" ) ).to.equal( "ÜÄÖ" )
            end
        }
    }
}