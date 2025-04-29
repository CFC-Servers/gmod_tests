return {
    groupName = "coroutine.create",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.create ).to.beA( "function" )
            end
        },

        {
            name = "Creates a coroutine properly",
            func = function()
                local co = coroutine.create(function()

                end)

                expect( co ).to.beA( "thread" )
            end
        },
    }
}
