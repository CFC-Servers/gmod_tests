return {
    groupName = "Global:ColorToHSV",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( ColorToHSV ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right values",
            func = function()
                local a = Color( 255, 255, 0 )

                local hue, saturation, value = ColorToHSV( a )
                expect( hue ).to.equal( 60 )
                expect( saturation ).to.equal( 1 )
                expect( value ).to.equal( 1 )
            end
        },
    }
}
