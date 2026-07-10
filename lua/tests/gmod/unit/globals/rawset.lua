--- @type GLuaTest_TestGroup
return {
    groupName = "Global:rawset",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( rawset ).to.beA( "function" )
            end
        },

        {
            name = "Sets the value at the given key",
            func = function()
                local tbl = {}
                rawset( tbl, "key", "value" )

                expect( tbl.key ).to.equal( "value" )
            end
        },

        {
            name = "Returns the table it modified",
            func = function()
                local tbl = {}
                local returned = rawset( tbl, "key", "value" )

                expect( returned ).to.equal( tbl )
            end
        },

        {
            name = "Ignores the __newindex metamethod",
            func = function()
                local metamethodRan = false

                local tbl = setmetatable( {}, {
                    __newindex = function() metamethodRan = true end
                } )

                rawset( tbl, "key", "value" )

                expect( metamethodRan ).to.beFalse()
                expect( tbl.key ).to.equal( "value" )
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( rawset, 5, "key", "value" ).to.errWith( [[bad argument #1 to '?' (table expected, got number)]] )
                expect( rawset, "abc", "key", "value" ).to.errWith( [[bad argument #1 to '?' (table expected, got string)]] )
            end
        }
    }
}
