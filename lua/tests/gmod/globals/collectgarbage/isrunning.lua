return {
    groupName = "isrunning action",
    cases = {
        {
            name = "Is not valid on 32bit versions",
            func = function()
                if jit.version ~= "LuaJIT 2.0.4" then return end

                expect( collectgarbage, "isrunning" ).to.errWith( [[bad argument #1 to '?' (invalid option 'isrunning')]] )
            end
        },

        {
            name = "Is valid on updated JIT versions",
            func = function()
                if jit.version ~= "LuaJIT 2.1.0-beta3" then return end

                expect( collectgarbage, "isrunning" ).to.succeed()
                expect( collectgarbage( "isrunning" ) ).to.beA( "boolean" )
            end
        }
    }
}
