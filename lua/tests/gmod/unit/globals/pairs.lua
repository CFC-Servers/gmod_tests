--- @type GLuaTest_TestGroup
return {
    groupName = "Global:pairs",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( pairs ).to.beA( "function" )
            end
        },

        {
            name = "Visits every key-value pair exactly once",
            func = function()
                local input = { a = 1, b = 2, c = 3 }

                local seen = {}
                for key, value in pairs( input ) do
                    seen[key] = value
                end

                expect( seen ).to.deepEqual( { a = 1, b = 2, c = 3 } )
            end
        },

        {
            name = "Visits both array and hash keys",
            func = function()
                local input = { "first", extra = "second" }

                local seen = {}
                for key, value in pairs( input ) do
                    seen[key] = value
                end

                expect( seen ).to.deepEqual( { "first", extra = "second" } )
            end
        },

        {
            name = "Never runs the loop body for an empty table",
            func = function()
                local ran = false
                for _ in pairs( {} ) do
                    ran = true
                end

                expect( ran ).to.beFalse()
            end
        },

        {
            name = "Returns an iterator function, the table, and nil",
            func = function()
                local input = { key = "value" }
                local iterator, tbl, startKey = pairs( input )

                expect( iterator ).to.beA( "function" )
                expect( tbl ).to.equal( input )
                expect( startKey ).to.beNil()
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( function() pairs( 5 ) end ).to.errWith( [[bad argument #1 to 'pairs' (table expected, got number)]] )
                expect( function() pairs( nil ) end ).to.errWith( [[bad argument #1 to 'pairs' (table expected, got nil)]] )
            end
        }
    }
}
