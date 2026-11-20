--- @type GLuaTest_TestGroup
return {
    groupName = "string.format: string specifiers",

    cases = {
        {
            name = "Substitutes strings with s",
            func = function()
                local greeting = string.format( "Hello %s!", "World" )
                expect( greeting ).to.equal( "Hello World!" )

                local multiple = string.format( "%s-%s", "a", "b" )
                expect( multiple ).to.equal( "a-b" )
            end
        },

        {
            name = "Converts non-string arguments for s with tostring",
            func = function()
                local number = string.format( "%s", 42 )
                expect( number ).to.equal( "42" )

                local boolean = string.format( "%s", true )
                expect( boolean ).to.equal( "true" )

                local nothing = string.format( "%s", nil )
                expect( nothing ).to.equal( "nil" )
            end
        },

        {
            name = "Quotes and escapes strings with q",
            func = function()
                local quoted = string.format( "%q", "abc" )
                expect( quoted ).to.equal( [["abc"]] )

                local withQuotes = string.format( "%q", [[say "hi"]] )
                expect( withQuotes ).to.equal( [["say \"hi\""]] )

                local withBackslash = string.format( "%q", [[a\b]] )
                expect( withBackslash ).to.equal( [["a\\b"]] )

                local withNewline = string.format( "%q", "a\nb" )
                expect( withNewline ).to.equal( "\"a\\\nb\"" )
            end
        },

        {
            name = "Produces a literal percent from a doubled percent",
            func = function()
                local percent = string.format( "100%%" )
                expect( percent ).to.equal( "100%" )
            end
        },

        {
            name = "Returns format strings without specifiers unchanged",
            func = function()
                local unchanged = string.format( "no specifiers here" )
                expect( unchanged ).to.equal( "no specifiers here" )

                local empty = string.format( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Ignores excess arguments",
            func = function()
                local formatted = string.format( "%s", "a", "b", "c" )
                expect( formatted ).to.equal( "a" )
            end
        },

        {
            name = "Errors on invalid specifiers",
            func = function()
                expect( string.format, "%z", 1 ).to.errWith( "invalid option '%z' to 'format'" )
            end
        }
    }
}
