--- @type GLuaTest_TestGroup
return {
    groupName = "bit.tohex",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.tohex ).to.beA( "function" )
            end
        },

        {
            name = "Correctly handles positive numbers",
            func = function()
                expect( bit.tohex( 255 ) ).to.equal( "000000ff" )
                expect( bit.tohex( 255, 4 ) ).to.equal( "00ff" )
            end
        },

        {
            name = "Correctly handles negative numbers",
            func = function()
                expect( bit.tohex( -1 ) ).to.equal( "ffffffff" )
                expect( bit.tohex( -2 ) ).to.equal( "fffffffe" )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.tohex, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.tohex, 1, nil ).toNot.err()

                expect( bit.tohex, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.tohex, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.tohex, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.tohex, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}