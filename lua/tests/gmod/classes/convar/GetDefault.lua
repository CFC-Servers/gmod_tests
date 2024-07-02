return {
    groupName = "ConVar:GetDefault",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetDefault ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                expect( a:GetDefault() ).to.equal( "1.2" )
                expect( a:GetDefault() ).toNot.equal( 1.2 )
            end
        },
    }
}