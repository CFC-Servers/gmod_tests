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
            name = "Truncates partial units instead of rounding",
            func = function()
                local halfMinute = string.NiceTime( 630 )
                expect( halfMinute ).to.equal( "10 minutes" )

                local almostNext = string.NiceTime( 659 )
                expect( almostNext ).to.equal( "10 minutes" )
            end
        },

        {
            name = "Switches units exactly at each tier boundary",
            func = function()
                local lastSecond = string.NiceTime( 59 )
                expect( lastSecond ).to.equal( "59 seconds" )

                local firstMinute = string.NiceTime( 60 )
                expect( firstMinute ).to.equal( "1 minute" )

                local lastMinute = string.NiceTime( 3599 )
                expect( lastMinute ).to.equal( "59 minutes" )

                local firstHour = string.NiceTime( 3600 )
                expect( firstHour ).to.equal( "1 hour" )

                local firstDay = string.NiceTime( 86400 )
                expect( firstDay ).to.equal( "1 day" )

                local firstWeek = string.NiceTime( 604800 )
                expect( firstWeek ).to.equal( "1 week" )

                local firstYear = string.NiceTime( 31536000 )
                expect( firstYear ).to.equal( "1 year" )
            end
        },

        {
            name = "Uses the singular only for a count of exactly one",
            func = function()
                local one = string.NiceTime( 1 )
                expect( one ).to.equal( "1 second" )

                local zero = string.NiceTime( 0 )
                expect( zero ).to.equal( "0 seconds" )

                local two = string.NiceTime( 2 )
                expect( two ).to.equal( "2 seconds" )
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
