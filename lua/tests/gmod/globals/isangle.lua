return {
    groupName = "Global:isangle",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( isangle ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right bool",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( isangle( vector ) ).to.beTrue()

                local fake_angle = setmetatable( { p = 1, y = 2, r = 3 }, getmetatable( angle ) )
                expect( isangle( fake_angle ) ).to.beFalse()
            end
        },
    }
}
