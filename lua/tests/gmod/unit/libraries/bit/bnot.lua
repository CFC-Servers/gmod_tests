--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bnot",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.bnot ).to.beA( "function" )
            end
        },

        {
            name = "Should correctly invert positive and negative numbers",
            func = function()
                expect( bit.bnot( 8 ) ).to.equal( -9 )
                expect( bit.bnot( 32 ) ).to.equal( -33 )
                expect( bit.bnot( -27534 ) ).to.equal( 27533 )
                expect( bit.bnot( -69 ) ).to.equal( 68 )
            end
        },

        {
            name = "Should handle edge cases correctly",
            func = function()
                expect( bit.bnot( 0 ) ).to.equal( -1 )
                expect( bit.bnot( -1 ) ).to.equal( 0 )

                expect( bit.bnot( 2147483647 ) ).to.equal( -2147483648 )
                expect( bit.bnot( -2147483648 ) ).to.equal( 2147483647 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.bnot, nil ).to.err()
                expect( bit.bnot, "abc" ).to.err()
                expect( bit.bnot, {} ).to.err()
            end
        },
    }
}