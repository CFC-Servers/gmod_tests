--- @type GLuaTest_TestGroup
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

                expect( math.Round(a[1], 5) ).to.equal( math.Round(0.2672612369060516357422, 5) )
                expect( math.Round(a[2], 5) ).to.equal( math.Round(0.5345224738121032714844, 5) )
                expect( math.Round(a[3], 5) ).to.equal( math.Round(0.8017836809158325195312, 5) )
            end
        },
    }
}
