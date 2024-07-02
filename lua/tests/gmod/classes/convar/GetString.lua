return {
    groupName = "ConVar:GetString",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetString ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                expect( a:GetString() ).to.equal( "1.2" )
            end
        },
    }
}