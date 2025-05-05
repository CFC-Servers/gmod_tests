return {
    groupName = "string.NiceTime",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.NiceTime ).to.beA( "function" )
            end
        },

        {
            name = "Formats strings correctly",
            func = function()
                expect( string.NiceTime( 0 ) ).to.equal( "0 seconds" )
                expect( string.NiceTime( 600 ) ).to.equal( "10 minutes" )
                expect( string.NiceTime( 630 ) ).to.equal( "10 minutes" )
                expect( string.NiceTime( 660 ) ).to.equal( "11 minutes" )
                expect( string.NiceTime( 4356 ) ).to.equal( "1 hour" )
                expect( string.NiceTime( 43545456 ) ).to.equal( "1 year" )
                expect( string.NiceTime( nil ) ).to.equal( "a few seconds" )
            end
        },

        {
            name = "Fails to format invalid inputs",
            func = function()
                expect( string.NiceTime( -600 ) ).to.equal( "-600 seconds" )
                expect( string.NiceTime( NULL ) ).to.err()
                expect( string.NiceTime( "string" ) ).to.err()
            end
        }
    }
}