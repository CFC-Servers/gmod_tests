--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bor",
    cases = {
        {
            name = "Function exists",
            func = function()
                expect( bit.bor ).to.beA( "function" )
            end
        },

        {
            name = "Correctly handles positive OR operations",
            func = function()
                expect( bit.bor( 8, 8 ) ).to.equal( 8 )
                expect( bit.bor( 8, 1 ) ).to.equal( 9 )
                expect( bit.bor( 27533, 17 ) ).to.equal( 27549 )
            end
        },

        {
            name = "Correctly handles negative OR operations",
            func = function()
                expect( bit.bor( -1, 0 ) ).to.equal( -1 )
                expect( bit.bor( -8, 1 ) ).to.equal( -7 )
                expect( bit.bor( -100, 50 ) ).to.equal( -66 )
            end
        },

        {
            name = "Correctly handles or operation with 0",
            func = function()
                expect( bit.bor( 0, 69 ) ).to.equal( 69 )
            end
        },

        {
            name = "Correctly returns result with mutliple args",
            func = function()
                expect( bit.bor( 1, 2, 4, 8 ) ).to.equal( 15 )
            end
        },

        {
            name = "Correctly handles min and max values",
            func = function()
                expect( bit.bor( 2147483647, 2147483648 ) ).to.equal( -1 )
                expect( bit.bor( -2147483648, 0 ) ).to.equal( -2147483648 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.bor, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.bor, 1, nil ).toNot.err()

                expect( bit.bor, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.bor, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.bor, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.bor, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}