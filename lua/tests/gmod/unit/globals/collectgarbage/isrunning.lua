return {
    groupName = "isrunning action",
    cases = {
        {
            name = "Is not valid on 32bit versions",
            when = jit.version == "LuaJIT 2.0.4",
            func = function()
                expect( collectgarbage, "isrunning" ).to.errWith( [[bad argument #1 to '?' (invalid option 'isrunning')]] )
            end
        },

        {
            name = "Is valid on x86-64",
            when = jit.version == "LuaJIT 2.1.0-beta3",
            func = function()
                expect( collectgarbage, "isrunning" ).to.succeed()
                expect( collectgarbage( "isrunning" ) ).to.beA( "boolean" )
            end
        },
    }
}
