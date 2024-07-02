return {
    groupName = "ConVar:SetFloat",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.SetFloat ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetFloat( 2 )

                expect( a:GetFloat() ).to.equal( 2 )
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                a:SetFloat( "3" ) -- Undocument: Allows a string as an arg

                expect( a:GetFloat() ).to.equal( 3 )
                a:Revert() -- Reset for next tests
            end
        },
    }
}