--- @type GLuaTest_TestGroup
return {
    groupName = "bit.arshift",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.arshift ).to.beA( "function" )
            end
        },

        {
            name = "Should correctly shift positive numbers",
            func = function()
                expect( bit.arshift( 8, 1 ) ).to.equal( 4 )
                expect( bit.arshift( 16, 2 ) ).to.equal( 4 )
                expect( bit.arshift( 0, 1 ) ).to.equal( 0 )
                expect( bit.arshift( 312, 0 ) ).to.equal( 312 )
                expect( bit.arshift( 123, 32 ) ).to.equal( 123 )
            end
        },

        {
            name = "Returns correct values for negative arhithmetic shifting",
            func = function()
                expect( bit.arshift( -8, 1 ) ).to.equal( -4 )
                expect( bit.arshift( -16, 2 ) ).to.equal( -4 )
                expect( bit.arshift( -12345, 5 ) ).to.equal( -386 )
                expect( bit.arshift( -1, 10 ) ).to.equal( -1 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.arshift, nil, nil ).to.err()
                expect( bit.arshift, "abc", "def" ).to.err()
                expect( bit.arshift, {}, {} ).to.err()
            end
        },
    }
}