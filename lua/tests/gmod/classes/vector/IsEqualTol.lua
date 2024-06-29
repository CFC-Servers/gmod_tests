return {
    groupName = "Vector:IsEqualTol",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.IsEqualTol ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1.0, 2.0, 3.0 )
                local b = Vector( 1.1, 2.1, 3.1 )

                expect( a:IsEqualTol( b, 0.10 ) ).to.equal( true )
                expect( a:IsEqualTol( b, 0.09 ) ).to.equal( false )
            end
        },
    }
}
