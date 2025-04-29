return {
    groupName = "Global:assert",
    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( assert ).to.beA( "function" )
            end
        },

        {
            name = "Does not throw an error when the condition is true",
            func = function()
                expect( assert, true ).notTo.err()
            end
        },

        {
            name = "Throws an error when the condition is false",
            func = function()
                expect( assert, false ).to.err()
            end
        },

        {
            name = "Throws an error when the condition is nil",
            func = function()
                expect( assert, nil ).to.err()
            end
        },

        {
            name = "Throws the correct default error message when the condition is false",
            func = function()
                expect( assert, false ).to.errWith( "assertion failed!" )
            end
        },

        {
            name = "Throws the given error message when the condition is false",
            func = function()
                local expected = "This is a custom error message!"
                expect( assert, false, expected ).to.errWith( expected )
            end
        },

        {
            name = "Returns the value when the condition is true",
            func = function()
                local value = "This is a value!"
                local ret = assert( value )

                expect( ret ).to.equal( value )
            end
        },
    }
}
