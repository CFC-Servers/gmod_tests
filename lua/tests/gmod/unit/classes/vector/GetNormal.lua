return {
    groupName = "Vector:GetNormal",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.GetNormal ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:GetNormal()

                expect( a[1] ).to.equal( 1 )
                expect( a[2] ).to.equal( 2 )
                expect( a[3] ).to.equal( 3 )

                if IS_64BIT_BRANCH then
                	expect( b[1] ).to.equal( 0.2672612071037292480469 )
                   	expect( b[2] ).to.equal( 0.5345224142074584960938 )
                   	expect( b[3] ).to.equal( 0.8017836213111877441406 )
                else
               	   	expect( b[1] ).to.equal( 0.2672612369060516357422 )
                   	expect( b[2] ).to.equal( 0.5345224738121032714844 )
                   	expect( b[3] ).to.equal( 0.8017836809158325195312 )
                end
            end
        },
    }
}
