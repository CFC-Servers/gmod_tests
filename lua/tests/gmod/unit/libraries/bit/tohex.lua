--- @type GLuaTest_TestGroup
return {
    groupName = "bit.tohex",
    cases = {
        {
            name = "Should be a function",
            func = function()
                expect( bit.tohex ).to.beA( "function" )
            end
        },

        {
            name = "psotive numbers",
            func = function()
                expect( bit.tohex( 255 ) ).to.equal( "000000ff" )
                expect( bit.tohex( 255, 4 ) ).to.equal( "00ff" )
            end
        },

        {
            name = "negative numbers",
            func = function()
                expect( bit.tohex( -1 ) ).to.equal( "ffffffff" )
                expect( bit.tohex( -2 ) ).to.equal( "fffffffe" )
            end
        },

        {
            name = "Fails on invalid input",
            func = function()
                expect( bit.tohex, nil ).to.err()
                expect( bit.tohex, "abc" ).to.err()
                expect( bit.tohex, {} ).to.err()
            end
        },
    }
}