--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bxor",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.bxor ).to.beA( "function" )
            end
        },

        {
            name = "Correctly handles positive XOR operations",
            func = function()
                expect( bit.bxor( 19, 82 ) ).to.equal( 65 )
                expect( bit.bxor( 327, 63 ) ).to.equal( 376 )
                expect( bit.bxor( 234, 0 ) ).to.equal( 234 )
            end
        },

        {
            name = "Correctly handles negative XOR operations",
            func = function()
                expect( bit.bxor( -99, -55 ) ).to.equal( 84 )
                expect( bit.bxor( -420, -67 ) ).to.equal( 481 )
                expect( bit.bxor( -32, 0 ) ).to.equal( -32 )
            end
        },

        {
            name = "Correctly handles same number input",
            func = function()
                expect( bit.bxor( 32, 32 ) ).to.equal( 0 )
            end
        },

        {
            name = "Correctly handles multiple args as input",
            func = function()
                expect( bit.bxor( 1, 2, 3, 4, 5 ) ).to.equal( 1 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.bxor, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.bxor, 1, nil ).toNot.err()

                expect( bit.bxor, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.bxor, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.bxor, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.bxor, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}