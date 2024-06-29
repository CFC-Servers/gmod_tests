return {
    groupName = "ConVar:SetBool",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.SetBool ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetBool( false )

                expect( a:GetBool() ).to.equal( false )
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetBool( "" ) -- Giving it anything that isn't false or nil will set it to true

                expect( a:GetBool() ).to.equal( true )
                a:Revert() -- Reset for next tests
            end
        },
    }
}