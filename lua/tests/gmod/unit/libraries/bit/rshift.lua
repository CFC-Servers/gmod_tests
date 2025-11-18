--- @type GLuaTest_TestGroup
return {
    groupName = "bit.rshift",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.rshift ).to.beA( "function" )
            end
        },

        {
            name = "Returns the correct values",
            func = function()
                expect( bit.rshift( 8, 1 ) ).to.equal( 4 )
                expect( bit.rshift( 16, 2 ) ).to.equal( 4 )
            end
        },

        {
            name = "Returns the correct valueswith negative input numbers",
            func = function()
                expect( bit.rshift( -8, 1 ) ).to.equal( 2147483644 )
                expect( bit.rshift( -16, 2 ) ).to.equal( 1073741820 )
            end
        },

        {
            name = "Correctly handles shifting the number 0",
            func = function()
                expect( bit.rshift( 0, 1 ) ).to.equal( 0 )
            end
        },

        {
            name = "Correctly handles shifting a number 0 times",
            func = function()
                expect( bit.rshift( 312, 0 ) ).to.equal( 312 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.rshift, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.rshift, 1, nil ).to.errWith( [[bad argument #2 to '?' (number expected, got no value)]] )

                expect( bit.rshift, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.rshift, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.rshift, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.rshift, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}