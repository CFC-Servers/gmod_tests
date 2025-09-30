return {
    groupName = "string.Left",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Left ).to.beA( "function" )
            end
        },

        {
            name = "Returns the expected string value",
            func = function()
                expect( string.Left( "Hello!", 1 ) ).to.equal( "H" )
                expect( string.Left( "H", 1 ) ).to.equal( "H" )
                expect( string.Left( "Hello!", 10 ) ).to.equal( "Hello!" )
                expect( string.Left( nil ) ).to.errWith( [[bad argument #1 to 'Left' (string expected, got nil)]] )
                expect( string.Left( nil, 1 ) ).to.errWith( [[bad argument #1 to 'Left' (string expected, got nil)]] )
                expect( string.Left( "Hello!" ) ).to.equal( "Hello!" )
                expect( string.Left( "Hello!", -1 ) ).to.equal( "Hello!" )
                expect( string.Left( "Hello World!", -8 ) ).to.equal( "Hello" )
                expect( string.Left( "garrys mod", 5 ) ).to.equal( "garry" )
            end
        }
    }
}