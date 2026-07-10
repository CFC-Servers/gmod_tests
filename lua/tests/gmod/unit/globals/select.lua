--- @type GLuaTest_TestGroup
return {
    groupName = "Global:select",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( select ).to.beA( "function" )
            end
        },

        {
            name = "Returns the number of arguments when given '#'",
            func = function()
                local count = select( "#", "a", "b", "c" )
                expect( count ).to.equal( 3 )
            end
        },

        {
            name = "Counts nil arguments in '#' mode",
            func = function()
                local count = select( "#", nil, nil, nil )
                expect( count ).to.equal( 3 )
            end
        },

        {
            name = "Returns zero when given '#' and no arguments",
            func = function()
                local count = select( "#" )
                expect( count ).to.equal( 0 )
            end
        },

        {
            name = "Returns all arguments starting from the given index",
            func = function()
                local second, third = select( 2, "a", "b", "c" )

                expect( second ).to.equal( "b" )
                expect( third ).to.equal( "c" )
            end
        },

        {
            name = "Returns nothing when the index is past the argument count",
            func = function()
                local count = select( "#", select( 4, "a", "b", "c" ) )
                expect( count ).to.equal( 0 )
            end
        },

        {
            name = "Errors when the index is zero",
            func = function()
                expect( select, 0, "a" ).to.errWith( [[bad argument #1 to '?' (index out of range)]] )
            end
        }
    }
}
