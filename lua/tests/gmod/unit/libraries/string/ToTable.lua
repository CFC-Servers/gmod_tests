--- @type GLuaTest_TestGroup
return {
    groupName = "string.ToTable",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.ToTable ).to.beA( "function" )
            end
        },

        {
            name = "Splits the string into a sequential table of characters",
            func = function()
                local chars = string.ToTable( "abc" )
                expect( chars ).to.deepEqual( { "a", "b", "c" } )
            end
        },

        {
            name = "Returns an empty table for an empty string",
            func = function()
                local chars = string.ToTable( "" )
                expect( chars ).to.deepEqual( {} )
            end
        },

        {
            name = "Splits multi-byte UTF-8 characters into one entry per byte",
            func = function()
                local chars = string.ToTable( "aé" )

                expect( #chars ).to.equal( 3 )
                expect( chars[1] ).to.equal( "a" )

                local rejoined = chars[2] .. chars[3]
                expect( rejoined ).to.equal( "é" )
            end
        },

        {
            name = "Preserves spaces and special characters as entries",
            func = function()
                local chars = string.ToTable( "a b" )
                expect( chars ).to.deepEqual( { "a", " ", "b" } )
            end
        }
    }
}
