return {
    groupName = "Global:isvector",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( isvector ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right bool",
            func = function()
                local vector = Vector( 1, 2, 3 )
                local angle = Angle( 1, 2, 3 )

                expect( isvector( vector ) ).to.beTrue()
                expect( isvector( angle ) ).to.beFalse()
            end
        },
    }
}
