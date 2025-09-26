--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bor",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.bor ).to.beA( "function" )
            end
        },

        {
            name = "Should handle positive numbers correctly",
            func = function()
                expect( bit.bor( 8, 8 ) ).to.equal( 8 )
                expect( bit.bor( 8, 1 ) ).to.equal( 9 )
                expect( bit.bor( 27533, 17 ) ).to.equal( 27549 )
            end
        },

        {
            name = "Should handle negative numbers correctly",
            func = function()
                expect( bit.bor( -1, 0 ) ).to.equal( -1 )
                expect( bit.bor( -8, 1 ) ).to.equal( -7 )
                expect( bit.bor( -100, 50 ) ).to.equal( -66 )
            end
        },

        {
            name = "Should handle zero values correctly",
            func = function()
                expect( bit.bor( 0, 69 ) ).to.equal( 69 )
                expect( bit.bor( -42, 0 ) ).to.equal( -42 )
            end
        },

        {
            name = "Returns correct value with multiple args",
            func = function()
                expect( bit.bor( 1, 2, 4, 8 ) ).to.equal( 15 )
            end
        },

        {
            name = "Handles Min and max values",
            func = function()
                expect( bit.bor( 2147483647, 2147483648 ) ).to.equal( -1 )
                expect( bit.bor( -2147483648, 0 ) ).to.equal( -2147483648 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.bor, nil, nil ).to.err()
                expect( bit.bor, "abc", "def" ).to.err()
                expect( bit.bor, {}, {} ).to.err()
            end
        },
    }
}