return {
    groupName = "stop action",
    cases = {
        {
            name = "'stop' action returns 0",
            func = function()
                local ret = collectgarbage( "stop" )
                expect( ret ).to.equal( 0 )
            end,

            cleanup = function()
                collectgarbage( "restart" )
            end
        },
    }
}
