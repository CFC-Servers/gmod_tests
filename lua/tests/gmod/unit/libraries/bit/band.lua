--- @type GLuaTest_TestGroup
return {
    groupName = "bit.band",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.band ).to.beA( "function" )
            end
        },

        {
            name = "Should handle positive numbers correctly",
            func = function()
                expect( bit.band( 8, 8 ) ).to.equal( 8 )
                expect( bit.band( 42, 17 ) ).to.equal( 0 )
                expect( bit.band( 13, 7 ) ).to.equal( 5 )
            end
        },

        {
            name = "Should handle negative numbers correctly",
            func = function()
                expect( bit.band( -8, 8 ) ).to.equal( 8 )
                expect( bit.band( -10, -12 ) ).to.equal( -12 )
            end
        },

        {
            name = "Functions properly with more than 2 args",
            func = function()
                expect( bit.band( 15, 67, 13 ) ).to.equal( 1 )
                expect( bit.band( 300, 200, 300 ) ).to.equal( 8 )
                expect( bit.band( 1, 2, 4, 8, 16, 32, 64 ) ).to.equal( 0 )
            end
        },

        {
            name = "Returns same result when args are flipped",
            func = function()
                expect( bit.band( 123, 456 ) ).to.equal( bit.band( 456, 123 ) )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.band, nil, nil ).to.err()
                expect( bit.band, "abc", "def" ).to.err()
                expect( bit.band, {}, {} ).to.err()
            end
        },
    }
}