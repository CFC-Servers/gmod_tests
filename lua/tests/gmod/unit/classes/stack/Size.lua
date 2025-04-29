return {
    groupName = "Stack:Size",

    cases = {
        {
            name = "Returns the stack size properly",
            func = function()
                local stack = util.Stack()
                stack[0] = 10

                local size = stack:Size()

                expect( size ).to.equal( 10 )

                stack[0] = -10
                local size = stack:Size()

                expect( size ).to.equal( -10 )
            end
        },
    }
}
