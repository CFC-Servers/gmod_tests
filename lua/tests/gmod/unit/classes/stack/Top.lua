return {
    groupName = "Stack:Top",

    cases = {
        {
            name = "returns the top of the stack properly",
            func = function()
                local stack = util.Stack()
                stack[0] = 2
                stack[1] = "Hello"
                stack[2] = "World"

                local top = stack:Top()

                expect( top ).to.equal( "World" ) -- top == stack[ stack[0] ]

                stack[0] = 1
                local top = stack:Top()

                expect( top ).to.equal( "Hello" )
            end
        },

        {
            name = "Return nil if stack length is zero",
            func = function()
                local stack = util.Stack()
                stack[-1] = "Hello"
                stack[0] = 0
                stack[1] = "World"

                local top = stack:Top()

                expect( top ).to.equal( nil )

                stack[0] = -1 -- It checks it with len == 0 and which should allow this
                local top = stack:Top()

                expect( top ).to.equal( "Hello" )
            end
        },
    }
}
