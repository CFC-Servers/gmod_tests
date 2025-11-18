--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bnot",
    cases = {
        {
            name = "Function exists",
            func = function()
                expect( bit.bnot ).to.beA( "function" )
            end
        },

        {
            name = "Correctly inverts input number",
            func = function()
                expect( bit.bnot( 8 ) ).to.equal( -9 )
                expect( bit.bnot( 32 ) ).to.equal( -33 )
                expect( bit.bnot( -27534 ) ).to.equal( 27533 )
                expect( bit.bnot( -69 ) ).to.equal( 68 )
            end
        },

        {
            name = "Correctly inverts 0 and -1",
            func = function()
                expect( bit.bnot( 0 ) ).to.equal( -1 )
                expect( bit.bnot( -1 ) ).to.equal( 0 )
            end
        },

        {
            name = "Correctly handles min and max values",
            func = function()
                expect( bit.bnot( 2147483647 ) ).to.equal( -2147483648 )
                expect( bit.bnot( -2147483648 ) ).to.equal( 2147483647 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.bnot, nil ).to.errWith( [[bad argument #1 to '?' (number expected, got no value)]] )
                expect( bit.bnot, "abc" ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.bnot, {} ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
            end
        },
    }
}