--- @type GLuaTest_TestGroup
return {
    groupName = "string.FormattedTime",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.FormattedTime ).to.beA( "function" )
            end
        },

        {
            name = "Returns a table of time units when no format is given",
            func = function()
                local units = string.FormattedTime( 3725.5 )

                expect( units ).to.beA( "table" )
                expect( units.h ).to.equal( 1 )
                expect( units.m ).to.equal( 2 )
                expect( units.s ).to.equal( 5 )
                expect( units.ms ).to.equal( 50 )
            end
        },

        {
            name = "Formats minutes, seconds, and milliseconds into the format string",
            func = function()
                local formatted = string.FormattedTime( 90, "%02i:%02i:%02i" )
                expect( formatted ).to.equal( "01:30:00" )

                local zero = string.FormattedTime( 0, "%02i:%02i:%02i" )
                expect( zero ).to.equal( "00:00:00" )
            end
        },

        {
            name = "Omits hours from the formatted string form",
            func = function()
                local formatted = string.FormattedTime( 3725, "%02i:%02i:%02i" )
                expect( formatted ).to.equal( "02:05:00" )
            end
        },

        {
            name = "Wraps negative times instead of clamping them",
            func = function()
                local wrapped = string.FormattedTime( -90, "%02i:%02i:%02i" )
                expect( wrapped ).to.equal( "58:30:00" )
            end
        },

        {
            name = "Treats nil as zero seconds",
            func = function()
                local units = string.FormattedTime( nil )

                expect( units ).to.beA( "table" )
                expect( units.h ).to.equal( 0 )
                expect( units.m ).to.equal( 0 )
                expect( units.s ).to.equal( 0 )
                expect( units.ms ).to.equal( 0 )
            end
        }
    }
}
