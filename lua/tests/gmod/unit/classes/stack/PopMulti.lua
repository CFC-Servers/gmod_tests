return {
    groupName = "Stack:PopMulti",

    cases = {
        {
            name = "Pops the values off the stack properly",
            func = function()
                local stack = util.Stack()
                stack[0] = 2
                stack[1] = "Hello"
                stack[2] = "World"

                stack:PopMulti( 2 )

                expect( stack[0] ).to.equal( 0 )
                expect( stack[1] ).to.equal( nil )
                expect( stack[2] ).to.equal( nil )
            end
        },

        {
            name = "Errors if we pop too much off the stack",
            func = function()
                local stack = util.Stack()
                stack[0] = 0
                
                local test = function()
                    stack:PopMulti( 2 )
                end

                expect( test ).to.errWith( [[attempted to pop 2 elements in stack of length 0]] )
            end
        },
    }
}
