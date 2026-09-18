--- @type GLuaTest_TestGroup
return {
    groupName = "string.ToMinutesSecondsMilliseconds",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.ToMinutesSecondsMilliseconds ).to.beA( "function" )
            end
        },

        {
            name = "Formats whole times as zero-padded fields",
            func = function()
                local zero = string.ToMinutesSecondsMilliseconds( 0 )
                expect( zero ).to.equal( "00:00:00" )

                local wrapped = string.ToMinutesSecondsMilliseconds( 3600 )
                expect( wrapped ).to.equal( "00:00:00" )
            end
        },

        {
            name = "Wraps the minutes and seconds fields at one hour and for negative times",
            func = function()
                local positive = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( string.sub( positive, 1, 5 ) ).to.equal( "01:30" )

                local negative = string.ToMinutesSecondsMilliseconds( -90.55 )
                expect( string.sub( negative, 1, 5 ) ).to.equal( "58:29" )
            end
        },

        {
            name = "Truncates the fraction field to thousandths (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local half = string.ToMinutesSecondsMilliseconds( 90.5 )
                expect( half ).to.equal( "01:30:500" )

                local truncated = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( truncated ).to.equal( "01:30:549" )

                local nearOverflow = string.ToMinutesSecondsMilliseconds( 59.999 )
                expect( nearOverflow ).to.equal( "00:59:999" )

                local negative = string.ToMinutesSecondsMilliseconds( -90.55 )
                expect( negative ).to.equal( "58:29:450" )
            end
        },

        {
            name = "Rounds the fraction field to hundredths (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local half = string.ToMinutesSecondsMilliseconds( 90.5 )
                expect( half ).to.equal( "01:30:50" )

                local rounded = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( rounded ).to.equal( "01:30:55" )

                local nearOverflow = string.ToMinutesSecondsMilliseconds( 59.999 )
                expect( nearOverflow ).to.equal( "00:59:100" )

                local negative = string.ToMinutesSecondsMilliseconds( -90.55 )
                expect( negative ).to.equal( "58:29:45" )
            end
        }
    }
}
