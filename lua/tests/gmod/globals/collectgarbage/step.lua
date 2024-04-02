return {
    groupName = "step action",
    cases = {
        {
            name = "Returns a boolean",
            func = function()
                local ret = collectgarbage( "step" )
                expect( ret ).to.beA( "boolean" )
            end,
        },
    }
}
