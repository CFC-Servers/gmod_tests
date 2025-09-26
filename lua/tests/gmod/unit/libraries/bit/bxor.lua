--- @type GLuaTest_TestGroup
return {
    groupName = "bit.bxor",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.bxor ).to.beA( "function" )
            end
        },

        {
            name = "Positive XOR operation",
            func = function()
                expect( bit.bxor( 19, 82 ) ).to.equal( 65 )
                expect( bit.bxor( 327, 63 ) ).to.equal( 376 )
                expect( bit.bxor( 234, 0 ) ).to.equal( 234 )
                expect( bit.bxor( 32, 32 ) ).to.equal( 0 )
            end
        },

        {
            name = "Negative XOR operation",
            func = function()
                expect( bit.bxor( -99, -55 ) ).to.equal( 84 )
                expect( bit.bxor( -420, -67 ) ).to.equal( 481 )
                expect( bit.bxor( -32, 0 ) ).to.equal( -32 )
                expect( bit.bxor( 42, -1 ) ).to.equal( -43 )
            end
        },

        {
            name = "Handles min and max 32-bit integers correctly",
            func = function()
                expect( bit.bxor( 2147483647, -2147483648 ) ).to.equal( -1 )
                expect( bit.bxor( 2147483647, 1 ) ).to.equal( 2147483646 ) 
            end
        },

        {
            name = "Handles multiple arguments correctly",
            func = function()
                expect( bit.bxor( 1, 2, 3, 4, 5 ) ).to.equal( 1 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.bxor, nil, nil ).to.err()
                expect( bit.bxor, "abc", "def" ).to.err()
                expect( bit.bxor, {}, {} ).to.err()
            end
        },
    }
}