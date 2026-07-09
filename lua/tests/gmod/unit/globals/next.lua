--- @type GLuaTest_TestGroup
return {
    groupName = "Global:next",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( next ).to.beA( "function" )
            end
        },

        {
            name = "Returns the first key and value of a table",
            func = function()
                local key, value = next( { onlyKey = "onlyValue" } )

                expect( key ).to.equal( "onlyKey" )
                expect( value ).to.equal( "onlyValue" )
            end
        },

        {
            name = "Returns nil for an empty table",
            func = function()
                local key = next( {} )
                expect( key ).to.beNil()
            end
        },

        {
            name = "Returns the next key and value when given a previous key",
            func = function()
                local key, value = next( { "a", "b" }, 1 )

                expect( key ).to.equal( 2 )
                expect( value ).to.equal( "b" )
            end
        },

        {
            name = "Returns nil when given the last key",
            func = function()
                local key = next( { "a" }, 1 )
                expect( key ).to.beNil()
            end
        },

        {
            name = "Visits every key exactly once when used to iterate",
            func = function()
                local input = { alpha = 1, bravo = 2, charlie = 3 }

                local seen = {}
                local key, value = next( input )
                while key ~= nil do
                    seen[key] = value
                    key, value = next( input, key )
                end

                expect( seen ).to.deepEqual( { alpha = 1, bravo = 2, charlie = 3 } )
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( function() next( 5 ) end ).to.errWith( [[bad argument #1 to 'next' (table expected, got number)]] )
                expect( function() next( "abc" ) end ).to.errWith( [[bad argument #1 to 'next' (table expected, got string)]] )
                expect( function() next( nil ) end ).to.errWith( [[bad argument #1 to 'next' (table expected, got nil)]] )
            end
        }
    }
}
