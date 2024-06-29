function GetTestConVar() -- Abusing the loading order :>
	return CreateConVar( "ConVarTest", "1.2", 0, "This is a Test", -10, 10 )
end

return {
    groupName = "ConVar:__tostring",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.__tostring ).to.beA( "function" )
            end
        },

        --[[{ -- NOTE: __tostring will error if given nil self? :/ (Try it again but in a shutdown hook which maybe runs after Lua created ConVars were destroyed?)
            name = "Returns the right value",
            func = function()
                local a = ConVar( "NoneExistentConVar" )

                expect( a:__tostring() ).to.equal( "ConVar [NULL]" )
            end
        },]]

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                expect( a:__tostring() ).to.equal( string.format("ConVar [%s]", "ConVarTest" ) )
            end
        },
    }
}