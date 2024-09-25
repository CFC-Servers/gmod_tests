return {
    groupName = "Stack:Pop",

    cases = {
        {
            name = "Pops the value off the stack properly",
            func = function()
                local stack = util.Stack()
                stack[0] = 2
                stack[1] = "Hello"
                stack[2] = "World"

                stack:Pop( 1 )

                expect( stack[0] ).to.equal( 1 )
                expect( stack[1] ).to.equal( "Hello" )
                expect( stack[2] ).to.equal( nil )

                stack:Pop( 1 )

                expect( stack[0] ).to.equal( 0 )
                expect( stack[1] ).to.equal( nil )
            end
        },

        {
            name = "Errors if we pop too much off the stack",
            func = function()
                local stack = util.Stack()
                stack[0] = 0
                
                local test = function()
                    stack:Pop( 1 )
                end

                expect( test ).to.errWith( [[attempted to pop 1 element in stack of length 0]] )
            end
        },
    }
}
