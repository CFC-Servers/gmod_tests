--- @type GLuaTest_TestGroup
return {
    groupName = "Global:unpack",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( unpack ).to.beA( "function" )
            end
        },

        {
            name = "Returns all elements of a sequential table",
            func = function()
                local first, second, third = unpack( { 1, 2, 3 } )

                expect( first ).to.equal( 1 )
                expect( second ).to.equal( 2 )
                expect( third ).to.equal( 3 )
            end
        },

        {
            name = "Returns elements starting from the given index",
            func = function()
                local first, second = unpack( { "a", "b", "c" }, 2 )

                expect( first ).to.equal( "b" )
                expect( second ).to.equal( "c" )
            end
        },

        {
            name = "Respects an explicit start and end range",
            func = function()
                local first, second, third = unpack( { "a", "b", "c", "d" }, 2, 3 )

                expect( first ).to.equal( "b" )
                expect( second ).to.equal( "c" )
                expect( third ).to.beNil()
            end
        },

        {
            name = "Returns nil values when the range extends past the table",
            func = function()
                local count = select( "#", unpack( {}, 1, 2 ) )
                expect( count ).to.equal( 2 )
            end
        },

        {
            name = "Returns nothing for an empty table",
            func = function()
                local count = select( "#", unpack( {} ) )
                expect( count ).to.equal( 0 )
            end
        },

        {
            name = "Errors when given a non-table",
            func = function()
                expect( function() unpack( "abc" ) end ).to.errWith( [[bad argument #1 to 'unpack' (table expected, got string)]] )
                expect( function() unpack( 5 ) end ).to.errWith( [[bad argument #1 to 'unpack' (table expected, got number)]] )
                expect( function() unpack( nil ) end ).to.errWith( [[bad argument #1 to 'unpack' (table expected, got nil)]] )
            end
        }
    }
}
