return {
    groupName = "Global:AngleRand",
    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( AngleRand ).to.beA( "function" )
            end
        },

        {
            name = "Returns an Angle",
            func = function()
                expect( AngleRand() ).to.beAn( "Angle" )
            end
        },

        {
            name = "Returns an Angle within the specified range",
            func = function()
                local min = -90
                local max = 90

                local out = AngleRand( min, max )
                local p, y, r = out[1], out[2], out[3]

                expect( p ).to.beGreaterThan( min )
                expect( p ).to.beLessThan( max )

                expect( y ).to.beGreaterThan( min )
                expect( y ).to.beLessThan( max )

                expect( r ).to.beGreaterThan( min )
                expect( r ).to.beLessThan( max )
            end
        }
    }
}
