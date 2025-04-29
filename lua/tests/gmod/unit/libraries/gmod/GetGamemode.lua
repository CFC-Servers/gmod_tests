return {
    groupName = "gmod.GetGamemode",

    cases = {
        {
            name = "Exists on the gmod table",
            func = function()
                expect( gmod.GetGamemode ).to.beA( "function" )
            end
        },

        {
            name = "Always returns the valid GAMEMODE table",
            func = function()
                local gm = gmod.GetGamemode()

                expect( gm ).to.equal( GAMEMODE or GM )
            end
        },

        {
            name = "Always returns the valid GAMEMODE table",
            func = function()
            	GAMEMODE = nil

                local gm = gmod.GetGamemode()

                expect( gm ).to.beA( "table" )

                GAMEMODE = gm
            end
        },
    }
}
