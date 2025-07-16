--- @type GLuaTest_TestGroup
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

               	expect( math.Round(b[1], 5) ).to.equal( math.Round(0.2672612369060516357422, 5) )
                expect( math.Round(b[2], 5) ).to.equal( math.Round(0.5345224738121032714844, 5) )
                expect( math.Round(b[3], 5) ).to.equal( math.Round(0.8017836809158325195312, 5) )
            end
        },
    }
}
