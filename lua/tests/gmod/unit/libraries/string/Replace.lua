--- @type GLuaTest_TestGroup
return {
    groupName = "string.Replace",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Replace ).to.beA( "function" )
            end
        },

        {
            name = "Replaces every occurrence of the needle",
            func = function()
                local replaced = string.Replace( "aaa", "a", "b" )
                expect( replaced ).to.equal( "bbb" )

                local words = string.Replace( "one two one", "one", "1" )
                expect( words ).to.equal( "1 two 1" )
            end
        },

        {
            name = "Returns the string unchanged when the needle is absent",
            func = function()
                local unchanged = string.Replace( "abc", "z", "!" )
                expect( unchanged ).to.equal( "abc" )
            end
        },

        {
            name = "Treats pattern magic characters as literals",
            func = function()
                local dotLiteral = string.Replace( "a.c", ".", "!" )
                expect( dotLiteral ).to.equal( "a!c" )

                local percentLiteral = string.Replace( "100%", "%", " percent" )
                expect( percentLiteral ).to.equal( "100 percent" )
            end
        },

        {
            name = "Inserts the replacement between every character for an empty needle",
            func = function()
                local spread = string.Replace( "abc", "", "-" )
                expect( spread ).to.equal( "a-b-c" )
            end
        },

        {
            name = "Removes the needle when the replacement is empty",
            func = function()
                local removed = string.Replace( "a-b-c", "-", "" )
                expect( removed ).to.equal( "abc" )
            end
        }
    }
}
