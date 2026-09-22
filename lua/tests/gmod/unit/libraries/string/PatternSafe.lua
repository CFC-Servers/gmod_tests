--- @type GLuaTest_TestGroup
return {
    groupName = "string.PatternSafe",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.PatternSafe ).to.beA( "function" )
            end
        },

        {
            name = "Escapes every pattern magic character",
            func = function()
                local escaped = string.PatternSafe( "().%+-*?[]^$" )
                expect( escaped ).to.equal( "%(%)%.%%%+%-%*%?%[%]%^%$" )
            end
        },

        {
            name = "Escapes the NUL byte as percent z",
            func = function()
                local escaped = string.PatternSafe( "\0" )
                expect( escaped ).to.equal( "%z" )
            end
        },

        {
            name = "Leaves plain text unchanged",
            func = function()
                local unchanged = string.PatternSafe( "hello world 123" )
                expect( unchanged ).to.equal( "hello world 123" )

                local empty = string.PatternSafe( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Makes untrusted needles safe for pattern functions",
            func = function()
                local needle = string.PatternSafe( "1.5" )

                local startPos = string.find( "value: 1.5", needle )
                expect( startPos ).to.equal( 8 )

                local noFalseMatch = string.find( "value: 1x5", needle )
                expect( noFalseMatch ).to.beNil()
            end
        }
    }
}
