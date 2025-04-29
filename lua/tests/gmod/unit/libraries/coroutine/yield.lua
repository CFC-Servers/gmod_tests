return {
    groupName = "coroutine.yield",
    cases = {
        {
            name = "Exists on the coroutine table",
            func = function()
                expect( coroutine.yield ).to.beA( "function" )
            end
        },

        {
            name = "Runs coroutine properly and passes arguments & returns", -- Exactly the same test as resume...
            func = function()
                local ret1, ret2 = nil, nil
                local co = coroutine.create(function(...)
                    ret1 = ({...})[1]
                    ret2 = coroutine.yield("Hello2")

                    return "World2"
                end)

                expect( co ).to.beA( "thread" )

                local retStatus1, retValue1 = coroutine.resume( co, "Hello" )

                expect( retStatus1 ).to.beTrue()
                expect( retValue1 ).to.equal( "Hello2" )
                expect( ret1 ).to.equal( "Hello" )
                expect( ret2 ).to.equal( nil )

                local retStatus2, retValue2 = coroutine.resume( co, "World" )

                expect( retStatus2 ).to.beTrue()
                expect( retValue2 ).to.equal( "World2" )
                expect( ret1 ).to.equal( "Hello" )
                expect( ret2 ).to.equal( "World" )
            end
        },
    }
}
