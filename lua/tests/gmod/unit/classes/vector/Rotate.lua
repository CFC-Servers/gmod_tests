--- @type GLuaTest_TestGroup
return {
    groupName = "Vector:Rotate",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Rotate ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = Angle( 90, 0, 0 )
                a:Rotate( b )

                expect( a[1] ).to.equal( 3 )
                expect( a[2] ).to.equal( 2 )
                expect( math.Round(a[3], 5) ).to.equal( math.Round(-1.0000001192092895507812, 5) )
            end
        },
    }
}
