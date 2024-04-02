return {
    groupName = "Global:collectgarbage",

    cases = {
        {
            name = "Exists in the Global table",
            func = function()
                expect( collectgarbage ).to.beA( "function" )
            end
        },


        {
            name = "Action defaults to 'collect' returns 0",
            func = function()
                local ret = collectgarbage()
                expect( ret ).to.equal( 0 )
            end
        },

        {
            name = "Fails with invalid action",
            func = function()
                expect( collectgarbage, "invalid_action" ).to.errWith( [[bad argument #1 to '?' (invalid option 'invalid_action')]] )
            end
        },
    }
}
