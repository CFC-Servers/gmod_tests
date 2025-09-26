--- @type GLuaTest_TestGroup
return {
    groupName = "bit.rol",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.rol ).to.beA( "function" )
            end
        },

        {
            name = "Rotating positive numbers returning the correct values",
            func = function()
                expect( bit.rol( 8, 1 ) ).to.equal( 16 )
                expect( bit.rol( 16, 1 ) ).to.equal( 32 )
                expect( bit.rol( 469, 4 ) ).to.equal( 7504 )
            end
        },

        {
            name = "Rotating negative numbers returning the correct values",
            func = function()
                expect( bit.rol( -8, 1 ) ).to.equal( -15 )
                expect( bit.rol( -16, 1 ) ).to.equal( -31 )
                expect( bit.rol( -469, 4 ) ).to.equal( -7489 )
            end
        },

        {
            name = "Returning input value on 0 rotations",
            func = function()
                expect( bit.rol( 412, 0 ) ).to.equal( 412 )
            end
        },

        {
            name = "Functions properly when rotating by 32",
            func = function()
                expect( bit.rol( 1, 32 ) ).to.equal( 1 )
                expect( bit.rol( 16, 32 ) ).to.equal( 16 )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.rol, nil, nil ).to.err()
                expect( bit.rol, "abc", "def" ).to.err()
                expect( bit.rol, {}, {} ).to.err()
            end
        },
    }
}