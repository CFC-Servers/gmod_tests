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
                local vector = Vector( 1, 2, 3 )

                expect( isangle( angle ) ).to.beTrue()
                expect( isangle( vector ) ).to.beFalse()
            end
        },
    }
}
