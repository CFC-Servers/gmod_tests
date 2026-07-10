--- @type GLuaTest_TestGroup
return {
    groupName = "Global:tonumber",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( tonumber ).to.beA( "function" )
            end
        },

        {
            name = "Converts numeric strings to numbers",
            func = function()
                expect( tonumber( "42" ) ).to.equal( 42 )
                expect( tonumber( "-7" ) ).to.equal( -7 )
                expect( tonumber( "1.5" ) ).to.equal( 1.5 )
                expect( tonumber( "1e2" ) ).to.equal( 100 )
            end
        },

        {
            name = "Passes numbers through unchanged",
            func = function()
                expect( tonumber( 10 ) ).to.equal( 10 )
                expect( tonumber( -1.5 ) ).to.equal( -1.5 )
            end
        },

        {
            name = "Ignores surrounding whitespace",
            func = function()
                local value = tonumber( "  42  " )
                expect( value ).to.equal( 42 )
            end
        },

        {
            name = "Converts hexadecimal strings",
            func = function()
                expect( tonumber( "0x10" ) ).to.equal( 16 )
                expect( tonumber( "0XFF" ) ).to.equal( 255 )
            end
        },

        {
            name = "Converts strings using the given base",
            func = function()
                expect( tonumber( "ff", 16 ) ).to.equal( 255 )
                expect( tonumber( "10", 2 ) ).to.equal( 2 )
                expect( tonumber( "z", 36 ) ).to.equal( 35 )
            end
        },

        {
            name = "Returns nil for values that cannot be converted",
            func = function()
                expect( tonumber( "abc" ) ).to.beNil()
                expect( tonumber( "" ) ).to.beNil()
                expect( tonumber( {} ) ).to.beNil()
                expect( tonumber( true ) ).to.beNil()
                expect( tonumber( nil ) ).to.beNil()
            end
        },

        {
            name = "Returns nil for digits outside the given base",
            func = function()
                local value = tonumber( "2", 2 )
                expect( value ).to.beNil()
            end
        }
    }
}
