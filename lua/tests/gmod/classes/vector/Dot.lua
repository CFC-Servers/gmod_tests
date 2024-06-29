return {
    groupName = "Vector:Dot",

    cases = {
        {
            name = "Exists on the Vector meta table",
            func = function()
                local meta = FindMetaTable( "Vector" )
                expect( meta.Dot ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = Vector( 0, 1, 0 )
                local b = Vector( 0, -1, 0 )
                local product = a:Dot( b )

                expect( product ).to.equal( -1 )
            end
        },
    }
}
