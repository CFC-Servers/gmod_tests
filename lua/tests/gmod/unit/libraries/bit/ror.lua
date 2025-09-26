--- @type GLuaTest_TestGroup
return {
    groupName = "bit.ror",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.ror ).to.beA( "function" )
            end
        },

        {
            name = "Rotating positive numbers returning the correct values",
            func = function()
                expect( bit.ror( 8, 1 ) ).to.equal( 4 )
                expect( bit.ror( 16, 1 ) ).to.equal( 8 )
                expect( bit.ror( 469, 4 ) ).to.equal( 1342177309 )
            end
        },

        {
            name = "Rotating negative numbers returning the correct values",
            func = function()
                expect( bit.ror( -8, 1 ) ).to.equal( 2147483644 )
                expect( bit.ror( -16, 1 ) ).to.equal( 2147483640 )
                expect( bit.ror( -469, 4 ) ).to.equal( -1073741854 )
            end
        },

        {
            name = "Returning input value on 0 rotations",
            func = function()
                expect( bit.ror( 412, 0 ) ).to.equal( 412 )
            end
        },

        {
            name = "Functions properly when rotating over the limit",
            func = function()
                expect( bit.ror( 1, 32 ) ).to.equal( 1 )
                expect( bit.ror( 16, 16 ) ).to.equal( 1048576 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.ror, nil, nil ).to.err()
                expect( bit.ror, "abc", "def" ).to.err()
                expect( bit.ror, {}, {} ).to.err()
            end
        },
    }
}