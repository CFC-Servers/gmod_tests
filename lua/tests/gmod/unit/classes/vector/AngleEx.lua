--- @type GLuaTest_TestGroup
return {
    groupName = "Vector:AngleEx",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.AngleEx ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Vector( 0, 0, 1 )
                local c = a:AngleEx( b )

                expect( math.Round(c[1], 4) ).to.aboutEqual( math.Round(-53.300769805908203125, 4) )
                expect( math.Round(c[2], 4) ).to.aboutEqual( math.Round(63.434947967529296875, 4) )
                expect( c[3] ).to.equal( 0 )
            end
        },
    }
}
