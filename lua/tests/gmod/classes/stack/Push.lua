return {
    groupName = "Stack:Push",

    cases = {
        {
            name = "Pushes the value onto the stack properly",
            func = function()
                local stack = util.Stack()
                stack[0] = 0

                stack:Push("Hello")

                expect( stack[0] ).to.equal( 1 )
                expect( stack[1] ).to.equal( "Hello" )
                expect( stack[2] ).to.equal( nil )

                stack:Push("World")

                expect( stack[0] ).to.equal( 2 )
                expect( stack[1] ).to.equal( "Hello" )
                expect( stack[2] ).to.equal( "World" )
            end
        },
    }
}
