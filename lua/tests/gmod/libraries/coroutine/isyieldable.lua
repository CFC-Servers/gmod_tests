return {
    groupName = "coroutine.isyieldable",
    cases = {
        {
            name = "Exists on the coroutine table",
            when = IS_64BIT_BRANCH,
            func = function()
                expect( coroutine.isyieldable ).to.beA( "function" )
            end
        },

        {
            name = "Creates a coroutine properly",
            when = IS_64BIT_BRANCH,
            func = function()
                local yieldable
                local co = coroutine.create(function()
                    yieldable = coroutine.isyieldable()
                end)

                expect( co ).to.beA( "thread" )

                coroutine.resume( co )

                expect( yieldable ).to.beTrue()
            end
        },
    }
}
