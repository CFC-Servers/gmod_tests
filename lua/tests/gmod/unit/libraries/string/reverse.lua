return {
    groupName = "string.reverse",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.reverse ).to.beA( "function" )
            end
        },

        {
            name = "Reverses ASCII strings properly",
            func = function()
                expect( string.reverse( "abcdef" ) ).to.equal( "fedcba" )
                expect( string.reverse( "a" ) ).to.equal( "a" )
                expect( string.reverse( "" ) ).to.equal( "" )
                expect( string.reverse( 1234 ) ).to.equal( 4321 )
                expect( string.reverse( tostring( nil ) ) ).to.equal( "lin" )
            end
        },

        {
            name = "Fails to reverse invalid inputs",
            func = function()
                expect( string.reverse( "üäö" ) == "üäö" ).to.beFalse()
                expect( string.reverse( nil ) ).to.err()
                expect( string.reverse( NULL ) ).to.err()
                expect( string.reverse( 0 / 0 ) ).to.equal( "nan" )
            end
        }
    }
}