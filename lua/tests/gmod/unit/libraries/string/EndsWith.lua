--- @type GLuaTest_TestGroup
return {
    groupName = "string.EndsWith",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.EndsWith ).to.beA( "function" )
            end
        },

        {
            name = "Returns true when the string ends with the suffix",
            func = function()
                local matches = string.EndsWith( "Hello World", "World" )
                expect( matches ).to.beTrue()

                local exact = string.EndsWith( "abc", "abc" )
                expect( exact ).to.beTrue()
            end
        },

        {
            name = "Returns false when the string does not end with the suffix",
            func = function()
                local elsewhere = string.EndsWith( "Hello World", "Hello" )
                expect( elsewhere ).to.beFalse()

                local caseMismatch = string.EndsWith( "abc", "ABC" )
                expect( caseMismatch ).to.beFalse()
            end
        },

        {
            name = "Returns true for an empty suffix",
            func = function()
                local empty = string.EndsWith( "abc", "" )
                expect( empty ).to.beTrue()
            end
        },

        {
            name = "Returns false when the suffix is longer than the string",
            func = function()
                local tooLong = string.EndsWith( "abc", "zabc" )
                expect( tooLong ).to.beFalse()
            end
        },

        {
            name = "Treats pattern magic characters as literals",
            func = function()
                local literalDot = string.EndsWith( "abc", "b." )
                expect( literalDot ).to.beFalse()
            end
        }
    }
}
