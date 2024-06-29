return {
    groupName = "ConVar:SetString",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.SetString ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetString( "2" )

                expect( a:GetString() ).to.equal( "2" )
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetString( 3 ) -- Undocument: Allows a number as an arg

                expect( a:GetString() ).to.equal( "3" )
                a:Revert() -- Reset for next tests
            end
        },
    }
}