return {
    groupName = "Vector:GetNormalized",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.GetNormalized ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:GetNormalized()

                expect( a[1] ).to.equal( 1 )
                expect( a[2] ).to.equal( 2 )
                expect( a[3] ).to.equal( 3 )

                expect( math.Round( b[1], 7 ) ).to.equal( 0.2672612 )
                expect( math.Round( b[2], 7 ) ).to.equal( 0.5345224 )
                expect( math.Round( b[3], 7 ) ).to.equal( 0.8017836 )
            end
        },
    }
}
