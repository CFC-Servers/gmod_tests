--- @type GLuaTest_TestGroup
return {
    groupName = "bit.arshift",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.arshift ).to.beA( "function" )
            end
        },

        {
            name = "Correctly shifts positive numbers",
            func = function()
                expect( bit.arshift( 8, 1 ) ).to.equal( 4 )
                expect( bit.arshift( 16, 2 ) ).to.equal( 4 )
                expect( bit.arshift( 0, 1 ) ).to.equal( 0 )
                expect( bit.arshift( 312, 0 ) ).to.equal( 312 )
                expect( bit.arshift( 123, 32 ) ).to.equal( 123 )
            end
        },

        {
            name = "Correctly shifts negative numbers",
            func = function()
                expect( bit.arshift( -8, 1 ) ).to.equal( -4 )
                expect( bit.arshift( -16, 2 ) ).to.equal( -4 )
                expect( bit.arshift( -12345, 5 ) ).to.equal( -386 )
                expect( bit.arshift( -1, 10 ) ).to.equal( -1 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.arshift, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.arshift, 1, nil ).to.errWith( [[bad argument #2 to '?' (number expected, got no value)]] )

                expect( bit.arshift, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.arshift, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.arshift, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.arshift, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}