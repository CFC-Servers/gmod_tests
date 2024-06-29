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

                if IS_64BIT_BRANCH then
                	expect( a[1] ).to.equal( 0.2672612071037292480469 )
                   	expect( a[2] ).to.equal( 0.5345224142074584960938 )
                   	expect( a[3] ).to.equal( 0.8017836213111877441406 )
                else
               	   	expect( a[1] ).to.equal( 0.2672612369060516357422 )
                   	expect( a[2] ).to.equal( 0.5345224738121032714844 )
                   	expect( a[3] ).to.equal( 0.8017836809158325195312 )
                end
            end
        },
    }
}
