return {
    groupName = "restart action",
    cases = {
        {
            name = "Returns 0",
            func = function()
                local ret = collectgarbage( "restart" )
                expect( ret ).to.equal( 0 )
            end,
        },
    }
}
