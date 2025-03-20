return {
    groupName = "Global:VectorRand",
    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( VectorRand ).to.beA( "function" )
            end
        },

        {
            name = "Returns an Vector",
            func = function()
                expect( VectorRand() ).to.beAn( "Vector" )
            end
        },

        {
            name = "Returns an Vector within the specified range",
            func = function()
                local min = -128
                local max = 128

                local out = VectorRand( min, max )
                local x, y, z = out.x, out.y, out.z

                expect( x ).to.beBetween( min, max )
                expect( y ).to.beBetween( min, max )
                expect( z ).to.beBetween( min, max )
            end
        }
    }
}
