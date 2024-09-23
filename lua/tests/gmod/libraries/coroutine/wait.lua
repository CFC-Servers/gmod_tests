return {
    groupName = "coroutine.wait",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.wait ).to.beA( "function" )
            end
        },

        {
            name = "Waits as expected", -- BUG: It doesn't want to work :/
            when = false, --GetConVar("sv_hibernate_think"):GetBool(), -- We need sv_hibernate_think enabled!
            func = function()
                local ret
                local co = coroutine.create(function()
                    coroutine.wait(0) -- Idk if the testing environment allows one to test it. (Update) Apparently we can't test it? or I'm dumb
                    ret = "Hello World"
                end)

                expect( co ).to.beA( "thread" )

                while ( ret == nil ) do -- no sv_hibernate_think = a funny test
                    coroutine.resume( co )
                end

                expect( ret ).to.equal( "Hello World" )
            end
        },
    }
}
