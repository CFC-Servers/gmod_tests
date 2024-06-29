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
                local b = CreateConVar( "ConVarTest2", "0.9", 0, "This is a Test 2" )

                expect( a:GetBool() ).to.equal( true ) -- It will always return true if the value is 1 or higher
                expect( b:GetBool() ).to.equal( false )
            end
        },
    }
}