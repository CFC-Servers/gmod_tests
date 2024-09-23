return {
    groupName = "coroutine.running",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.running ).to.beA( "function" )
            end
        },

        {
            name = "Returns nil outside a coroutine",
            func = function()
                local running = coroutine.running()

                expect( running ).to.beNil()
            end
        }, {
            name = "Returns the running coroutine",
            func = function()
                local co = coroutine.create(function()
                    return coroutine.running()
                end)

                expect( co ).to.beA( "thread" )

                local _, resumeStatus = coroutine.resume( co )

                expect( co ).to.equal( resumeStatus )
            end
        },
    }
}
