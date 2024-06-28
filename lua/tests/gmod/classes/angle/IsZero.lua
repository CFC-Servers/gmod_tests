return {
    groupName = "Angle:IsZero",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.IsZero ).to.beA( "function" )
            end
        },

        {
            name = "Returns a boolean",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:IsZero()
                expect( out ).to.beA( "boolean" )
            end
        },

        {
            name = "Returns true when the Angle is zero",
            func = function()
                local a = Angle( 0, 0, 0 )

                local out = a:IsZero()
                expect( out ).to.beTrue()
            end
        },

        {
            name = "Returns false when the Angle has no 0's",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:IsZero()
                expect( out ).to.beFalse()
            end
        }
    }
}
