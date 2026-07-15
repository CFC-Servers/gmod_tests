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
            name = "Formats seconds as zero-padded MM:SS:MS",
            func = function()
                local zero = string.ToMinutesSecondsMilliseconds( 0 )
                expect( zero ).to.equal( "00:00:00" )

                local formatted = string.ToMinutesSecondsMilliseconds( 90.5 )
                expect( formatted ).to.equal( "01:30:50" )
            end
        },

        {
            name = "Expresses milliseconds as hundredths subject to float truncation",
            func = function()
                local truncated = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( truncated ).to.equal( "01:30:54" )

                local nearOverflow = string.ToMinutesSecondsMilliseconds( 59.999 )
                expect( nearOverflow ).to.equal( "00:59:99" )
            end
        },

        {
            name = "Wraps at one hour and for negative times",
            func = function()
                local wrapped = string.ToMinutesSecondsMilliseconds( 3600 )
                expect( wrapped ).to.equal( "00:00:00" )

                local negative = string.ToMinutesSecondsMilliseconds( -90.55 )
                expect( negative ).to.equal( "58:29:45" )
            end
        }
    }
}
