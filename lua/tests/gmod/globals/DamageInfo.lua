return {
    groupName = "Global:DamageInfo",

    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( DamageInfo ).to.beA( "function" )
            end
        },

        {
            name = "Returns a CTakeDamageInfo object",
            func = function()
                local damageInfo = DamageInfo()
                expect( damageInfo ).to.beA( "CTakeDamageInfo" )
            end
        },

        {
            name = "Has a CTakeDamageInfo Metatable",
            func = function()
                local meta = FindMetaTable( "CTakeDamageInfo" )

                local damageInfo = DamageInfo()
                expect( debug.getmetatable( damageInfo ) ).to.equal( meta )
            end
        },
    }
}
