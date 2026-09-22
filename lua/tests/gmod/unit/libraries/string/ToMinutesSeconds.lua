--- @type GLuaTest_TestGroup
return {
    groupName = "string.ToMinutesSeconds",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.ToMinutesSeconds ).to.beA( "function" )
            end
        },

        {
            name = "Formats seconds as zero-padded MM:SS",
            func = function()
                local formatted = string.ToMinutesSeconds( 90 )
                expect( formatted ).to.equal( "01:30" )

                local zero = string.ToMinutesSeconds( 0 )
                expect( zero ).to.equal( "00:00" )

                local underTen = string.ToMinutesSeconds( 61 )
                expect( underTen ).to.equal( "01:01" )
            end
        },

        {
            name = "Truncates fractional seconds",
            func = function()
                local truncated = string.ToMinutesSeconds( 59.9 )
                expect( truncated ).to.equal( "00:59" )
            end
        },

        {
            name = "Wraps at one hour instead of exceeding 59 minutes",
            func = function()
                local wrapped = string.ToMinutesSeconds( 3600 )
                expect( wrapped ).to.equal( "00:00" )

                local pastHour = string.ToMinutesSeconds( 3690 )
                expect( pastHour ).to.equal( "01:30" )
            end
        },

        {
            name = "Wraps negative times instead of clamping them",
            func = function()
                local wrapped = string.ToMinutesSeconds( -90 )
                expect( wrapped ).to.equal( "58:30" )
            end
        }
    }
}
