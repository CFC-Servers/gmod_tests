return {
    groupName = "Global:BroadcastLua",
    cases = {
        {
            name = "Exists in the Global table",
            func = function()
                expect( BroadcastLua ).to.beA( "function" )
            end
        },

        {
            name = "Succeeds when given valid lua",
            func = function()
                expect( BroadcastLua, "return 1" ).to.succeed()
            end
        },

        {
            name = "Succeeds when given invalid lua",
            when = WHEN_NO_HUMANS, -- Prevent noisy CL lua errors when testing on local server
            func = function()
                expect( BroadcastLua, "function)( hello!" ).to.succeed()
            end
        },

        {
            name = "Succeeds when given empty string",
            when = WHEN_NO_HUMANS, -- Prevent noisy CL warning print when testing on local server
            func = function()
                expect( BroadcastLua, "" ).to.succeed()
            end
        },

        {
            -- The function is limited to 254 characters and will print a basic engine error, but still not-error if given more
            name = "Succeeds when given 256 characters",
            func = function()
                local str = string.rep( "a", 256 )
                expect( BroadcastLua, str ).to.succeed()
            end
        },

        {
            name = "Fail when given nil",
            func = function()
                expect( BroadcastLua, nil ).to.errWith( "bad argument #1 to '?' (string expected, got no value)" )
            end
        },
    }
}
