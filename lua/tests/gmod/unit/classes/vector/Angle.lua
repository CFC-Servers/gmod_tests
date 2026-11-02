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

                expect( b[1] ).to.aboutEqual( 306.69921  )
                if IS_BASE_BRANCH and VERSION >= 260706 then
                    -- RaphaelIT7: GMod switched to SteamRT4 on the main branch which changed glibc & abi stuff and it seems like this result changed because of that
                    expect( b[2] ).to.aboutEqual( 63.43495 )
                else
                    expect( b[2] ).to.aboutEqual( 63.43494 )
                end
                expect( b[3] ).to.equal( 0 )
            end
        },
    }
}
