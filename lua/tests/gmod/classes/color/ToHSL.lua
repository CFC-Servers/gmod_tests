return {
    groupName = "Color:ToHSL",

    cases = {
        {
            name = "Exists on the Color meta table",
            func = function()
                local meta = FindMetaTable( "Color" )
                expect( meta.ToHSL ).to.beA( "function" )
            end
        },

        {
            name = "Returns the proper numbers",
            func = function()
                local a = Color( 255, 255, 0 )

                local hue, saturation, value = a:ToHSL()
                expect( hue ).to.equal( 60 )
                expect( saturation ).to.equal( 1 )
                expect( value ).to.equal( 0.5 )
            end
        }
    }
}