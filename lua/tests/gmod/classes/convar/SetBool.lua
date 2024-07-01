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
            name = "Sets booleans correctly",
            func = function()
                local a = GetTestConVar()

                a:SetBool( false )

                expect( a:GetBool() ).to.beFalse()
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Defaults to `true` if given anything other than false or nil",
            func = function()
                local a = GetTestConVar()

                a:SetBool( "" ) -- Giving it anything that isn't false or nil will set it to true

                expect( a:GetBool() ).to.beTrue()
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Defaults to `true` if given anything other than false or nil",
            func = function()
                local a = GetTestConVar()

                a:SetBool( {} ) -- Giving it anything that isn't false or nil will set it to true

                expect( a:GetBool() ).to.beTrue()
                a:Revert() -- Reset for next tests
            end
        },

        {
            name = "Defaults to `true` if given anything other than false or nil",
            func = function()
                local a = GetTestConVar()

                a:SetBool( Vector( 1, 2, 3 ) ) -- Giving it anything that isn't false or nil will set it to true

                expect( a:GetBool() ).to.beTrue()
                a:Revert() -- Reset for next tests
            end
        },
    }
}