--- @type GLuaTest_TestGroup
return {
    groupName = "Global:tostring",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( tostring ).to.beA( "function" )
            end
        },

        {
            name = "Converts primitive values to strings",
            func = function()
                expect( tostring( 42 ) ).to.equal( "42" )
                expect( tostring( 1.5 ) ).to.equal( "1.5" )
                expect( tostring( true ) ).to.equal( "true" )
                expect( tostring( false ) ).to.equal( "false" )
                expect( tostring( nil ) ).to.equal( "nil" )
            end
        },

        {
            name = "Passes strings through unchanged",
            func = function()
                local value = tostring( "already a string" )
                expect( value ).to.equal( "already a string" )
            end
        },

        {
            name = "Uses the __tostring metamethod when present",
            func = function()
                local tbl = setmetatable( {}, {
                    __tostring = function() return "custom string" end
                } )

                local value = tostring( tbl )
                expect( value ).to.equal( "custom string" )
            end
        },

        {
            name = "Formats plain tables with a table prefix",
            func = function()
                local value = tostring( {} )

                local prefix = string.sub( value, 1, 7 )
                expect( prefix ).to.equal( "table: " )
            end
        },

        {
            name = "Errors when called with no arguments",
            func = function()
                expect( tostring ).to.errWith( [[bad argument #1 to '?' (value expected)]] )
            end
        }
    }
}
