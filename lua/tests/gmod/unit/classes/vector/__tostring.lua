return {
    groupName = "Vector:__tostring",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1.2345678, 2.3456789, 3.4567890 )

                expect( a:__tostring() ).to.equal( string.format("%f %f %f", 1.2345678, 2.3456789, 3.4567890 ) )
            end
        },
    }
}
