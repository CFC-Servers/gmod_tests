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
            name = "Waits as expected",
            async = true,
            timeout = 0.75,
            func = function()
                local expected = "Hello World"

                local co = coroutine.create( function()
                    coroutine.wait( 0.25 )
                    coroutine.yield( expected )
                end )

                -- When we first start it, it will immediately suspend itself and not yield anything
                local ran, ret = coroutine.resume( co )
                expect( ran ).to.beTrue()
                expect( ret ).to.beNil()
                expect( coroutine.status( co ) ).to.equal( "suspended" )

                timer.Simple( 0.5, function()
                    ran, ret = coroutine.resume( co )
                    expect( ran ).to.beTrue()
                    expect( ret ).to.equal( expected )
                    done()
                end )
            end
        },

        {
            name = "Waits one frame when given 0",
            async = true,
            timeout = 0.1,
            func = function()
                local expected = "Hello World"

                local co = coroutine.create( function()
                    coroutine.wait( 0 )
                    coroutine.yield( expected )
                end )

                -- When we first start it, it will immediately suspend itself and not yield anything
                local ran, ret = coroutine.resume( co )
                expect( ran ).to.beTrue()
                expect( ret ).to.beNil()
                expect( coroutine.status( co ) ).to.equal( "suspended" )

                timer.Simple( 0, function()
                    ran, ret = coroutine.resume( co )
                    expect( ran ).to.beTrue()
                    expect( ret ).to.equal( expected )
                    done()
                end )
            end
        }
    }
}