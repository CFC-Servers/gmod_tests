--- @type GLuaTest_TestGroup
return {
    groupName = "Vector:Angle",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Angle ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:Angle()

                expect( math.Round(b[1], 4) ).to.equal( math.Round(306.69921875, 4) )
                expect( math.Round(b[2], 4) ).to.equal( math.Round(63.434947967529296875, 4) )
                expect( b[3] ).to.equal( 0 )
            end
        },
    }
}
