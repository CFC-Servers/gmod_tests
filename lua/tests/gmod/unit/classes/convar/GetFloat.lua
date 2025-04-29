return {
    groupName = "ConVar:GetFloat",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetFloat ).to.beA( "function" )
            end
        },

        {
            name = "Returns the expected value",
            func = function()
                local a = GetTestConVar()

                expect( a:GetFloat() ).to.equal( 1.2000000476837158203125 ) -- GetFloat has a precision error :/ (To get the full number use "string.format("%.22f", a:GetFloat())")
                expect( a:GetFloat() ).toNot.equal( 1.2 )
            end
        },
    }
}