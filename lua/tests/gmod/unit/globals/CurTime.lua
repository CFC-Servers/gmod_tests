return {
    groupName = "Global:CurTime",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( CurTime ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function()
                local output = CurTime()
                expect( output ).to.beA( "number" )
            end
        },

        {
            name = "Is cached for a single frame",
            func = function()
                local time1 = CurTime()
                local time2 = CurTime()

                expect( time1 ).to.equal( time2 )
            end
        },

        {
            name = "Increases over time",
            async = true,
            timeout = 2,
            func = function()
                local startTime = CurTime()

                hook.Add( "Think", "GmodTests_CurTimeTest", function()
                    hook.Remove( "Think", "GmodTests_CurTimeTest" )

                    local endTime = CurTime()
                    expect( endTime ).to.beGreaterThan( startTime )

                    done()
                end )
            end
        },
    }
}
