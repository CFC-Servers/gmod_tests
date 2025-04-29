return {
    groupName = "ConVar:Revert",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.Revert ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetString( "3.4" )
                expect( a:GetString() ).to.equal( "3.4" )

                a:Revert()
                expect( a:GetString() ).to.equal( "1.2" )
            end
        },
    }
}