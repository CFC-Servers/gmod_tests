function GetTestConVar( name, value, description ) -- Abusing the loading order :>
	return CreateConVar( "ConVarTest" .. ( name or "" ), value or "1.2", 0, description or "This is a Test", -10, 10 )
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

        {
            name = "Errors when called with a nil self",
            func = function()
                local __tostring = FindMetaTable( "ConVar" ).__tostring

                local function test()
                    __tostring( nil )
                end

                expect( test ).to.errWith( [[bad argument #1 to '__tostring' (ConVar expected, got nil)]] )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                local expected = string.format("ConVar [%s]", "ConVarTest" )
                expect( a:__tostring() ).to.equal( expected )
            end
        },
    }
}