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
                expect( isvector( vector ) ).to.beTrue()

                local fake_vector = setmetatable( { x = 1, y = 2, z = 3 }, getmetatable( vector ) )
                expect( isvector( fake_vector ) ).to.beFalse()
            end
        },
    }
}
