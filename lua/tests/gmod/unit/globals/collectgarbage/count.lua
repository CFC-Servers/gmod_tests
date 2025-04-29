return {
    groupName = "count action",
    cases = {
        {
            name = "Returns a number",
            func = function()
                local ret = collectgarbage( "count" )
                expect( ret ).to.beA( "number" )
            end,
        },
    }
}
