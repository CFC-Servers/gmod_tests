return {
    groupName = "ConVar:SetInt",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.SetInt ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetInt( 2.2 ) -- Will ignore all decimals

                expect( a:GetInt() ).to.equal( 2 )
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetInt( "3.3" ) -- Undocument: Allows a string as an arg. This will also ignore all decimals

                expect( a:GetInt() ).to.equal( 3 )
                a:Revert() -- Reset for next tests
            end
        },
    }
}