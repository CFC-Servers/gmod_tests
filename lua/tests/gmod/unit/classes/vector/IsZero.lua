return {
    groupName = "Vector:IsZero",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.IsZero ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )

                expect( a:IsZero() ).to.beFalse()

                a[1] = 0
                a[2] = 0
                a[3] = 0

                expect( a:IsZero() ).to.beTrue()
            end
        },
    }
}
