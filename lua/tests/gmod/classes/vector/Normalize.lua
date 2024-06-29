return {
    groupName = "Vector:Normalize",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Normalize ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                a:Normalize()

                expect( math.Round( a[1], 7 ) ).to.equal( 0.2672612 )
                expect( math.Round( a[2], 7 ) ).to.equal( 0.5345224 )
                expect( math.Round( a[3], 7 ) ).to.equal( 0.8017836 )
            end
        },
    }
}
