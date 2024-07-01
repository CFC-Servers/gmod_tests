return {
    groupName = "Vector:Div",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Div ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                a:Div( 2 )

                expect( a[1] ).to.equal( 0.5 )
                expect( a[2] ).to.equal( 1 )
                expect( a[3] ).to.equal( 1.5 )
            end
        },

        {
            name = "Takes a Vector as the divisor argument",
            func = function()
                local a = Vector( 1, 2, 3.0 )
                local b = Vector( 2, 4, 0.5 )
                a:Div( b )

                expect( a[1] ).to.equal( 0.5 )
                expect( a[2] ).to.equal( 0.5 )
                expect( a[3] ).to.equal( 6.0 )
            end
        },
    }
}
