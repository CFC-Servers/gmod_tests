return {
    groupName = "Angle:__tostring",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Angle( 1.2346, 2.3456, 3.4567 )

                -- BUG: string.format %.3f will round up if it's over 5 while V_snprintf will do it if it's 5 or higher. Try 1.2345 for the first arg for both and see it
                expect( a:__tostring() ).to.equal( string.format("%.3f %.3f %.3f", 1.2346, 2.3456, 3.4567 ) )
            end
        },
    }
}
