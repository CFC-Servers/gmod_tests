--- @type GLuaTest_TestGroup
return {
    groupName = "string.StartsWith",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.StartsWith ).to.beA( "function" )
            end
        },

        {
            name = "Returns true when the string starts with the prefix",
            func = function()
                local matches = string.StartsWith( "Hello World", "Hello" )
                expect( matches ).to.beTrue()

                local exact = string.StartsWith( "abc", "abc" )
                expect( exact ).to.beTrue()
            end
        },

        {
            name = "Returns false when the string does not start with the prefix",
            func = function()
                local elsewhere = string.StartsWith( "Hello World", "World" )
                expect( elsewhere ).to.beFalse()

                local caseMismatch = string.StartsWith( "abc", "ABC" )
                expect( caseMismatch ).to.beFalse()
            end
        },

        {
            name = "Returns true for an empty prefix",
            func = function()
                local empty = string.StartsWith( "abc", "" )
                expect( empty ).to.beTrue()
            end
        },

        {
            name = "Returns false when the prefix is longer than the string",
            func = function()
                local tooLong = string.StartsWith( "ab", "abc" )
                expect( tooLong ).to.beFalse()
            end
        },

        {
            name = "Treats pattern magic characters as literals",
            func = function()
                local literalDot = string.StartsWith( "abc", ".b" )
                expect( literalDot ).to.beFalse()
            end
        }
    }
}
