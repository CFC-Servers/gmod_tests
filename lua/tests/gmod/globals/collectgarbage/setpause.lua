return {
    groupName = "setpause action",

    beforeAll = function( state )
        state.original = collectgarbage( "setpause" )
        collectgarbage( "setpause", state.original )
    end,

    afterEach = function( state )
        collectgarbage( "setpause", state.original )
    end,

    cases = {
        {
            name = "Returns the last value",
            func = function()
                local newValue = 69

                local ret = collectgarbage( "setpause", newValue )
                expect( ret ).to.beA( "number" )

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( newValue )
            end,
        },

        {
            name = "Accepts negative values",
            func = function()
                local newValue = -200
                expect( collectgarbage, "setpause", newValue ).to.succeed()

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( newValue )
            end,
        },

        {
            name = "Accepts nil, and defaults to 0",
            func = function()
                expect( collectgarbage, "setpause", nil ).to.succeed()

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( 0 )
            end,
        },

        {
            name = "Accepts string numbers",
            func = function()
                local newValue = 69
                expect( collectgarbage, "setpause", tostring( newValue ) ).to.succeed()

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( newValue )
            end,
        },

        {
            name = "Accepts floats, and rounds up (base branch)",
            when = jit.version == "LuaJIT 2.0.4",
            func = function()
                local newValue = 100.6
                expect( collectgarbage, "setpause", newValue ).to.succeed()

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( 101 )
            end,
        },
        {
            name = "Accepts floats, and rounds down (x86-64)",
            when = jit.version == "LuaJIT 2.1.0-beta3",
            func = function()
                local newValue = 100.6
                expect( collectgarbage, "setpause", newValue ).to.succeed()

                local lastValue = collectgarbage( "setpause", 200 )
                expect( lastValue ).to.equal( 100 )
            end,
        },

        {
            name = "Fails if given an empty string",
            func = function()
                expect( collectgarbage, "setpause", "" ).to.errWith( [[bad argument #2 to '?' (number expected, got string)]] )
            end,
        },
    }
}
