return {
    groupName = "ConVar:GetBool",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetBool ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()
                local b = GetTestConVar( "2", "0.9" )

                expect( a:GetBool() ).to.beTrue() -- It will always return true if the value is 1 or higher
                expect( b:GetBool() ).to.beFalse()
            end
        },
    }
}