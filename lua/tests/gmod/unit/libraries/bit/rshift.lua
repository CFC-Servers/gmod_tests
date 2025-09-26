--- @type GLuaTest_TestGroup
return {
    groupName = "bit.rshift",
    cases = {
        {
            name = "Should be a function",
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
            name = "Shifting 0 should remain 0",
            func = function()
                expect( bit.rshift( 0, 1 ) ).to.equal( 0 )
            end
        },

        {
            name = "Shifting 0 times",
            func = function()
                expect( bit.rshift( 312, 0 ) ).to.equal( 312 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.rshift, nil, nil ).to.err()
                expect( bit.rshift, "abc", "def" ).to.err()
                expect( bit.rshift, {}, {} ).to.err()
            end
        },
    }
}