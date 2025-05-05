return {
    groupName = "string.NiceName",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.NiceName ).to.beA( "function" )
            end
        },

        {
            name = "Reformats strings correctly",
            func = function()
                expect( string.NiceName( "string_likeThis" ) ).to.equal( "String like this" )
                expect( string.NiceName( "hi_whats_up" ) ).to.equal( "Hi whats up" )
                expect( string.NiceName( "Nothing much how about you?" ) ).to.equal( "Nothing much how about you ?" )
                expect( string.NiceName( "just testing_some stringsHere" ) ).to.equal( "Just testing some strings Here" )
                expect( string.NiceName( "" ) ).to.equal( "" )
                expect( string.NiceName( "üäö_üäö") ).to.equal( "üäö üäö" )
            end
        },

        {
            name = "Fails to reformat invalid inputs",
            func = function()
                expect( string.NiceName( nil ) ).to.err()
                expect( string.NiceName( NULL ) ).to.err()
                expect( string.NiceName( 1 ) ).to.err()
            end
        }
    }
}