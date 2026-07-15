--- @type GLuaTest_TestGroup
return {
    groupName = "string.JavascriptSafe",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.JavascriptSafe ).to.beA( "function" )
            end
        },

        {
            name = "Escapes quotes and backslashes",
            func = function()
                local doubleQuote = string.JavascriptSafe( [["]] )
                expect( doubleQuote ).to.equal( [[\"]] )

                local singleQuote = string.JavascriptSafe( [[']] )
                expect( singleQuote ).to.equal( [[\']] )

                local backslash = string.JavascriptSafe( [[\]] )
                expect( backslash ).to.equal( [[\\]] )
            end
        },

        {
            name = "Escapes newlines and control characters as letter escapes",
            func = function()
                local newline = string.JavascriptSafe( "\n" )
                expect( newline ).to.equal( [[\n]] )

                local carriageReturn = string.JavascriptSafe( "\r" )
                expect( carriageReturn ).to.equal( [[\r]] )

                local tab = string.JavascriptSafe( "\t" )
                expect( tab ).to.equal( [[\t]] )
            end
        },

        {
            name = "Escapes the NUL byte as a hex escape",
            func = function()
                local nul = string.JavascriptSafe( "\0" )
                expect( nul ).to.equal( [[\x00]] )
            end
        },

        {
            name = "Escapes the JavaScript line separators U+2028 and U+2029",
            func = function()
                local lineSeparator = string.JavascriptSafe( "\226\128\168" )
                expect( lineSeparator ).to.equal( "\\\226\128\168" )

                local paragraphSeparator = string.JavascriptSafe( "\226\128\169" )
                expect( paragraphSeparator ).to.equal( "\\\226\128\169" )
            end
        },

        {
            name = "Leaves plain text and forward slashes unchanged",
            func = function()
                local plain = string.JavascriptSafe( "hello world 123" )
                expect( plain ).to.equal( "hello world 123" )

                local slash = string.JavascriptSafe( "/" )
                expect( slash ).to.equal( "/" )

                local empty = string.JavascriptSafe( "" )
                expect( empty ).to.equal( "" )
            end
        }
    }
}
