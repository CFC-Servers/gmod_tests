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

                expect( a[1] ).to.aboutEqual( 0.26726 )
                expect( a[2] ).to.aboutEqual( 0.53452 )
                expect( a[3] ).to.aboutEqual( 0.80178 )
            end
        },
    }
}
