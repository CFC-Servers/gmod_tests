return {
    groupName = "Vector:Length",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Length ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 1, 2, 3 )
                local b = a:Length()

                expect( b ).to.equal( 3.7416574954986572265625 ) -- return value isn't precise, so this wouldn't work "math.sqrt( math.pow( 1, 2 ) + math.pow( 2, 2 ) + math.pow( 3, 2 ) )"
            end
        },
    }
}
