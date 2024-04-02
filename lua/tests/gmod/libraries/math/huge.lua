return {
    groupName = "math.huge",

    cases = {
        {
            name = "Exists on the math table",
            func = function()
                expect( math.huge ).to.beA( "number" )
            end
        },

        {
            name = "Returns a value that is never less than any other number",
            func = function()
                local huge = math.huge

                expect( huge ).to.beGreaterThan( 0 )
                expect( huge ).to.beGreaterThan( 99999999 )
                expect( huge ).to.equal( huge )
            end
        }
    }
}
