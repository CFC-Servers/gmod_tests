return {
    groupName = "ConVar:GetHelpText",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetHelpText ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                expect( a:GetHelpText() ).to.equal( "This is a Test" )
            end
        },
    }
}