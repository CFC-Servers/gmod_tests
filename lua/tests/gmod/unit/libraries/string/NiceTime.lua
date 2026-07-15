--- @type GLuaTest_TestGroup
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
            name = "Formats durations using the largest fitting unit",
            func = function()
                local seconds = string.NiceTime( 0 )
                expect( seconds ).to.equal( "0 seconds" )

                local minutes = string.NiceTime( 600 )
                expect( minutes ).to.equal( "10 minutes" )

                local hours = string.NiceTime( 4356 )
                expect( hours ).to.equal( "1 hour" )

                local days = string.NiceTime( 172800 )
                expect( days ).to.equal( "2 days" )

                local weeks = string.NiceTime( 1209600 )
                expect( weeks ).to.equal( "2 weeks" )

                local years = string.NiceTime( 43545456 )
                expect( years ).to.equal( "1 year" )
            end
        },

        {
            name = "Rounds to the nearest unit instead of truncating",
            func = function()
                local roundedDown = string.NiceTime( 630 )
                expect( roundedDown ).to.equal( "10 minutes" )

                local roundedUp = string.NiceTime( 660 )
                expect( roundedUp ).to.equal( "11 minutes" )
            end
        },

        {
            name = "Describes nil as a few seconds",
            func = function()
                local vague = string.NiceTime( nil )
                expect( vague ).to.equal( "a few seconds" )
            end
        },

        {
            name = "Formats negative durations as negative seconds",
            func = function()
                local negative = string.NiceTime( -600 )
                expect( negative ).to.equal( "-600 seconds" )
            end
        },

        {
            name = "Errors on non-numeric inputs",
            func = function()
                expect( string.NiceTime, NULL ).to.errWith( "attempt to compare userdata with number" )
                expect( string.NiceTime, "string" ).to.errWith( "attempt to compare string with number" )
            end
        }
    }
}
