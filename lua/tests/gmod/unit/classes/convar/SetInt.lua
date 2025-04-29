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
            name = "Ignores decimals when given a float",
            func = function()
                local a = GetTestConVar()

                a:SetInt( 2.2 )

                expect( a:GetInt() ).to.equal( 2 )
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Ignores decimals when given a string",
            func = function()
                local a = GetTestConVar()

                a:SetInt( "3.3" )

                expect( a:GetInt() ).to.equal( 3 )
                a:Revert() -- Reset for next tests
            end
        },
    }
}