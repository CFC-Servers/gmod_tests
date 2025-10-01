--- @type GLuaTest_TestGroup
return {
    groupName = "bit.tobit",
    cases = {
        {
            name = "Functions exists",
            func = function()
                expect( bit.tobit ).to.beA( "function" )
            end
        },

        {
            name = "Correctly returns unchanged values",
            func = function()
                expect( bit.tobit( 1 ) ).to.equal(1)
                expect( bit.tobit( -1 ) ).to.equal(-1)
            end
        },

        {
            name = "Behaves correctly when handling large numbers",
            func = function()
                expect( bit.tobit( 2147483647 ) ).to.equal(2147483647)
                expect( bit.tobit( 2147483648 ) ).to.equal(-2147483648)
            end
        },

        {
            name = "Handles Non-integer values",
            func = function()
                expect( bit.tobit( 1.1 ) ).to.equal(1)
                expect( bit.tobit( -1 ) ).to.equal(-1)
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.tobit, nil ).to.errWith( [[bad argument #1 to '?' (number expected, got no value)]] )
                expect( bit.tobit, "abc" ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.tobit, {} ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
            end
        },
    }
}