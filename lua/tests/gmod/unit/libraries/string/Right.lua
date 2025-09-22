return {
    groupName = "string.Right",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Right ).to.beA( "function" )
            end
        },

        {
            name = "Returns the expected string value",
            func = function()
                expect( string.Right( "Hello!", 1 ) ).to.equal( "!" )
                expect( string.Right( "H", 1 ) ).to.equal( "H" )
                expect( string.Right( "Hello!", 10 ) ).to.equal( "Hello!" )
                expect( string.Right( nil ) ).to.errWith( [[attempt to perform arithmetic on local 'num']] )
                expect( string.Right( nil, 1 ) ).to.errWith( [[bad argument #1 to 'Right']] )
                expect( string.Right( "Hello!" ) ).to.errWith( [[attempt to perform arithmetic on local 'num']] )
                expect( string.Right( "Hello!", -1 ) ).to.equal( "Hello!" )
                expect( string.Right( "garrys mod", 3 ) ).to.equal( "mod" )
            end
        }
    }
}