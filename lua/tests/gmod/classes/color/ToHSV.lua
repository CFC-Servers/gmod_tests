return {
    groupName = "Color:ToHSV",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.ToHSV ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper numbers",
            func = function()
                local a = Color( 255, 255, 0 )

                local hue, saturation, value = a:ToHSV()
                expect( hue ).to.equal( 60 )
                expect( saturation ).to.equal( 1 )
                expect( value ).to.equal( 1 )
            end
        }
    }
}