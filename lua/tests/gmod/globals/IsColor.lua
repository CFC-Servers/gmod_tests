return {
    groupName = "Global:IsColor",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( IsColor ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right bool",
            func = function()
                local a = Color( 1, 2, 3 )
                local b = Vector( 1, 2, 3 )

                expect( IsColor( a ) ).to.beTrue()
                expect( IsColor( b ) ).to.beFalse()
            end
        },
    }
}
