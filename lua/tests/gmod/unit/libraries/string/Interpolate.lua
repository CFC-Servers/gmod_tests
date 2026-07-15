--- @type GLuaTest_TestGroup
return {
    groupName = "string.Interpolate",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Interpolate ).to.beA( "function" )
            end
        },

        {
            name = "Substitutes braced names with values from the lookup table",
            func = function()
                local combined = string.Interpolate( "{a} and {b}", { a = "x", b = "y" } )
                expect( combined ).to.equal( "x and y" )
            end
        },

        {
            name = "Converts non-string values with tostring",
            func = function()
                local number = string.Interpolate( "{n}", { n = 5 } )
                expect( number ).to.equal( "5" )
            end
        },

        {
            name = "Leaves placeholders without a lookup entry untouched",
            func = function()
                local partial = string.Interpolate( "{a} and {missing}", { a = "x" } )
                expect( partial ).to.equal( "x and {missing}" )
            end
        },

        {
            name = "Never substitutes numeric placeholders even with matching string keys",
            func = function()
                local arrayKeyed = string.Interpolate( "{1}", { "first" } )
                expect( arrayKeyed ).to.equal( "{1}" )

                local stringKeyed = string.Interpolate( "{1}", { ["1"] = "first" } )
                expect( stringKeyed ).to.equal( "{1}" )
            end
        },

        {
            name = "Ignores empty placeholders",
            func = function()
                local empty = string.Interpolate( "{}", {} )
                expect( empty ).to.equal( "{}" )
            end
        },

        {
            name = "Substitutes inside doubled braces",
            func = function()
                local nested = string.Interpolate( "{{a}}", { a = "x" } )
                expect( nested ).to.equal( "{x}" )
            end
        }
    }
}
