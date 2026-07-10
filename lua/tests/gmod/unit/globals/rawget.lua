--- @type GLuaTest_TestGroup
return {
    groupName = "Global:rawget",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( rawget ).to.beA( "function" )
            end
        },

        {
            name = "Returns the value stored at the given key",
            func = function()
                local value = rawget( { key = "value" }, "key" )
                expect( value ).to.equal( "value" )
            end
        },

        {
            name = "Returns nil for a missing key",
            func = function()
                local value = rawget( {}, "missing" )
                expect( value ).to.beNil()
            end
        },

        {
            name = "Ignores the __index metamethod",
            func = function()
                local tbl = setmetatable( {}, {
                    __index = function() return "from metamethod" end
                } )

                expect( tbl.missing ).to.equal( "from metamethod" )

                local rawValue = rawget( tbl, "missing" )
                expect( rawValue ).to.beNil()
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( rawget, 5, "key" ).to.errWith( [[bad argument #1 to '?' (table expected, got number)]] )
                expect( rawget, "abc", "key" ).to.errWith( [[bad argument #1 to '?' (table expected, got string)]] )
            end
        }
    }
}
