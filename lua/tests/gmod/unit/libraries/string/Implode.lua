--- @type GLuaTest_TestGroup
return {
    groupName = "string.Implode",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Implode ).to.beA( "function" )
            end
        },

        {
            name = "Joins table values with the separator",
            func = function()
                local joined = string.Implode( ",", { "a", "b" } )
                expect( joined ).to.equal( "a,b" )
            end
        },

        {
            name = "Reverses string.Explode",
            func = function()
                local parts = string.Explode( ",", "a,b,c" )
                local rejoined = string.Implode( ",", parts )
                expect( rejoined ).to.equal( "a,b,c" )
            end
        },

        {
            name = "Returns an empty string for an empty table",
            func = function()
                local empty = string.Implode( ",", {} )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Errors when a table value is not a string or number",
            func = function()
                local subject = function()
                    string.Implode( ",", { "a", {} } )
                end

                expect( subject ).to.errWith( "invalid value (table) at index 2 in table for 'concat'" )
            end
        }
    }
}
