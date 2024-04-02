return {
    groupName = "collect action",
    cases = {
        {
            name = "Returns 0",
            func = function()
                local ret = collectgarbage( "collect" )
                expect( ret ).to.equal( 0 )
            end
        }
    }
}
