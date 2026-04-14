--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bswap",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.bswap ).to.beA( "function" )
            end
        },

        {
            name = "Correctly returns swapped value",
            func = function()
                expect( bit.bswap( 327 ) ).to.equal( 1191247872 )
                expect( bit.bswap( 8 ) ).to.equal( 134217728 )
            end
        },

        {
            name = "Correctly handles swapping 0 and -1",
            func = function()
                expect( bit.bswap( 0 ) ).to.equal( 0 )
                expect( bit.bswap( -1 ) ).to.equal( -1 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.bswap, nil ).to.errWith( [[bad argument #1 to '?' (number expected, got no value)]] )
                expect( bit.bswap, "abc" ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.bswap, {} ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
            end
        },
    }
}