return {
    groupName = "coroutine.status",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.status ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper status",
            func = function()
                local ret1, ret2 = nil, nil
                local co = coroutine.create(function(...)
                    return coroutine.status( ( {...} )[1] )
                end)

                expect( co ).to.beA( "thread" )
                expect( coroutine.status( co ) ).to.equal( "suspended" )

                local _, resumeStatus = coroutine.resume( co, co )

                expect( resumeStatus ).to.equal( "running" )
                expect( coroutine.status( co ) ).to.equal( "dead" )
            end
        },
    }
}
