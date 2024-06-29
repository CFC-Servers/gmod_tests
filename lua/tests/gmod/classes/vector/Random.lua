return {
    groupName = "Vector:Random",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Random ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 0, 0, 0 )
                
                a:Random( -10, 10 )

                expect( a[1] ).to.beBetween( -10, 10 )
                expect( a[2] ).to.beBetween( -10, 10 )
                expect( a[3] ).to.beBetween( -10, 10 )
            end
        },
    }
}
