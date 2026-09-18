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
            name = "Expresses the fraction field as thousandths",
            func = function()
                local half = string.ToMinutesSecondsMilliseconds( 90.5 )
                expect( half ).to.equal( "01:30:500" )

                local nearOverflow = string.ToMinutesSecondsMilliseconds( 59.999 )
                expect( nearOverflow ).to.equal( "00:59:999" )
            end
        },

        {
            name = "Wraps negative times past one hour",
            func = function()
                local negative = string.ToMinutesSecondsMilliseconds( -90.55 )
                expect( negative ).to.equal( "58:29:450" )
            end
        },

        {
            name = "Truncates the fraction field toward zero (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local truncated = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( truncated ).to.equal( "01:30:549" )
            end
        },

        {
            name = "Rounds the fraction field to the nearest thousandth (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local rounded = string.ToMinutesSecondsMilliseconds( 90.55 )
                expect( rounded ).to.equal( "01:30:550" )
            end
        }
    }
}
