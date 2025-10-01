--- @type GLuaTest_TestGroup
return {
    groupName = "bit.rol",
    cases = {
        {
            name = "Function exists",
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
            name = "Functions properly when rotating over the limit",
            func = function()
                expect( bit.rol( 1, 32 ) ).to.equal( 1 )
                expect( bit.rol( 16, 16 ) ).to.equal( 1048576 )
            end
        },

        {
            name = "Throws error when not given a number",
            func = function()
                expect( bit.rol, nil, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got nil)]] )
                expect( bit.rol, 1, nil ).to.errWith( [[bad argument #2 to '?' (number expected, got no value)]] )

                expect( bit.rol, "abc", 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
                expect( bit.rol, 1, "def" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )

                expect( bit.rol, {}, 1 ).to.errWith( [[bad argument #1 to '?' (number expected, got table)]] )
                expect( bit.rol, 1, {} ).to.errWith( [[bad argument #2 to '?' (number expected, got table)]] )
            end
        },
    }
}