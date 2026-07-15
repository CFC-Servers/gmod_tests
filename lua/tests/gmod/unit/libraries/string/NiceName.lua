--- @type GLuaTest_TestGroup
return {
    groupName = "string.NiceName",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.NiceName ).to.beA( "function" )
            end
        },

        {
            name = "Replaces underscores with spaces and capitalizes words",
            func = function()
                local spaced = string.NiceName( "hi_whats_up" )
                expect( spaced ).to.equal( "Hi whats up" )

                local plain = string.NiceName( "hello" )
                expect( plain ).to.equal( "Hello" )
            end
        },

        {
            name = "Splits words at internal capital letters",
            func = function()
                local split = string.NiceName( "string_likeThis" )
                expect( split ).to.equal( "String like This" )

                local mixed = string.NiceName( "just testing_some stringsHere" )
                expect( mixed ).to.equal( "Just testing some strings Here" )
            end
        },

        {
            name = "Separates trailing punctuation into its own word",
            func = function()
                local spacedPunctuation = string.NiceName( "Nothing much how about you?" )
                expect( spacedPunctuation ).to.equal( "Nothing much how about you ?" )
            end
        },

        {
            name = "Passes UTF-8 letters through without capitalization",
            func = function()
                local unchanged = string.NiceName( "üäö_üäö" )
                expect( unchanged ).to.equal( "üäö üäö" )
            end
        },

        {
            name = "Returns an empty string unchanged",
            func = function()
                local empty = string.NiceName( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Errors on non-string inputs",
            func = function()
                expect( string.NiceName, nil ).to.errWith( "attempt to index local 'name' (a nil value)" )
                expect( string.NiceName, NULL ).to.errWith( "attempt to call method 'Replace' (a nil value)" )
                expect( string.NiceName, 1 ).to.errWith( "attempt to index local 'name' (a number value)" )
            end
        }
    }
}
