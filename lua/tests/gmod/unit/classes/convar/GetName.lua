return {
    groupName = "ConVar:GetName",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetName ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                expect( a:GetName() ).to.equal( "ConVarTest" )
            end
        },
    }
}