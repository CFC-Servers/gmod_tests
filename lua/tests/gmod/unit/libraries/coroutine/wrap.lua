return {
    groupName = "coroutine.wrap",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.wrap ).to.beA( "function" )
            end
        },

        {
            name = "Runs coroutine properly and passes arguments & returns", -- Exactly the same test as resume...
            func = function()
                local co
                local func = coroutine.wrap(function()
                    co = coroutine.running()

                    coroutine.yield()

                    return "Hello World"
                end)

                expect( func ).to.beA( "function" )

                func()

                expect( co ).to.beA( "thread" )

                expect( func() ).to.equal( "Hello World" )
            end
        },
    }
}
