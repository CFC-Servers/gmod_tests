--- @type GLuaTest_TestGroup
return {
    groupName = "bit.lshift",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.lshift ).to.beA( "function" )
            end
        },

        {
            name = "Should correctly shift positive numbers",
            func = function()
                expect( bit.lshift( 15, 4 ) ).to.equal( 240 )
                expect( bit.lshift( 96, 4 ) ).to.equal( 1536 )
                expect( bit.lshift( 63, 2 ) ).to.equal( 252 )
            end
        },

        {
            name = "Should correctly shift negative numbers",
            func = function()
                expect( bit.lshift( -8, 1 ) ).to.equal( -16 )
            end
        },

        {
            name = "Values are getting clamped over the signed 32-bit int limit",
            func = function()
                expect( bit.lshift( 4294967295, 1 ) ).to.equal( -2 )
                expect( bit.lshift( 1, 31 ) ).to.equal( -2147483648 )
            end
        },

        {
            name = "Shifting 0 times should return the same value",
            func = function()
                expect( bit.lshift( 1, 0 ) ).to.equal( 1 )
                expect( bit.lshift( 12345678, 0 ) ).to.equal( 12345678 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.lshift, nil, nil ).to.err()
                expect( bit.lshift, "abc", "def" ).to.err()
                expect( bit.lshift, {}, {} ).to.err()
            end
        },
    }
}