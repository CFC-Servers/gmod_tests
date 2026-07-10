--- @type GLuaTest_TestGroup
return {
    groupName = "Global:ipairs",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( ipairs ).to.beA( "function" )
            end
        },

        {
            name = "Iterates sequential elements in order",
            func = function()
                local visited = {}
                for index, value in ipairs( { "a", "b", "c" } ) do
                    table.insert( visited, { index, value } )
                end

                expect( visited ).to.deepEqual( { { 1, "a" }, { 2, "b" }, { 3, "c" } } )
            end
        },

        {
            name = "Stops at the first nil element",
            func = function()
                local input = { 1, 2, nil, 4 }

                local count = 0
                for _ in ipairs( input ) do
                    count = count + 1
                end

                expect( count ).to.equal( 2 )
            end
        },

        {
            name = "Does not visit non-sequential keys",
            func = function()
                local input = { "first", key = "value" }

                local count = 0
                for _ in ipairs( input ) do
                    count = count + 1
                end

                expect( count ).to.equal( 1 )
            end
        },

        {
            name = "Never runs the loop body for an empty table",
            func = function()
                local ran = false
                for _ in ipairs( {} ) do
                    ran = true
                end

                expect( ran ).to.beFalse()
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( function() ipairs( nil ) end ).to.errWith( [[bad argument #1 to 'ipairs' (table expected, got nil)]] )
                expect( function() ipairs( 5 ) end ).to.errWith( [[bad argument #1 to 'ipairs' (table expected, got number)]] )
            end
        }
    }
}
