return {
    groupName = "Global:ColorAlpha",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( ColorAlpha ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Color object",
            func = function()
                local output = ColorAlpha( Color( 100, 100, 100, 255 ), 100 )
                expect( output ).to.beA( "table" )
                expect( debug.getmetatable( output ) ).to.equal( FindMetaTable( "Color" ) )
            end
        },

        {
            name = "Returns a Color with the same RGB values and the new Alpha value",
            func = function()
                local inp = Color( 100, 100, 100, 255 )

                local newAlpha = 100
                local output = ColorAlpha( inp, newAlpha )

                expect( output.r ).to.equal( inp.r )
                expect( output.g ).to.equal( inp.g )
                expect( output.b ).to.equal( inp.b )
                expect( output.a ).to.equal( newAlpha )
            end
        },

        {
            name = "Does not modify the input Color",
            func = function()
                local inp = Color( 100, 100, 100, 255 )
                ColorAlpha( inp, 100 )

                expect( inp.r ).to.equal( 100 )
                expect( inp.g ).to.equal( 100 )
                expect( inp.b ).to.equal( 100 )
                expect( inp.a ).to.equal( 255 )
            end
        },
    }
}
