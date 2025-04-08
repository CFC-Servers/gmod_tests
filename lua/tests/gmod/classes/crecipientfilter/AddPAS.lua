return WithBotTestTools( {
    groupName = "CRecipientFilter:AddPAS",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddPAS ).to.beA( "function" )
            end
        },

        {
            name = "Adds targets from the PAS of the given vector",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                -- Assuming setting them way below the map will be a different PAS
                secondBot:SetPos( firstBot:GetPos() - Vector( 0, 0, 99999 ) )

                filter:AddPAS( firstBot:GetPos() )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 1 )
                expect( added[1] ).to.equal( firstBot )

                done()
            end
        },
    }
} )
