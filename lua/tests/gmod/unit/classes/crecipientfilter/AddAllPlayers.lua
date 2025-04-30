return WithBotTestTools( {
    groupName = "CRecipientFilter:AddAllPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddAllPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Adds all currently connected players",
            async = true,
            timeout = 2,
            coroutine = true,
            when = WHEN_NO_HUMANS,
            func = function( state )
                state.kickAllBots()
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 3
                local filter = RecipientFilter()
                local bots = state.addBots( botCount )
                local botLookup = {} do
                    for i = 1, botCount do
                        botLookup[bots[i]] = true
                    end
                end

                filter:AddAllPlayers()

                local added = filter:GetPlayers()
                expect( #added ).to.equal( botCount )

                for i = 1, #added do
                    local ply = added[i]
                    expect( botLookup[ply] ).to.beTrue()
                end

                done()
            end
        },

        {
            name = "Does nothing when no players are connected",
            async = true,
            timeout = 1,
            coroutine = true,
            when = WHEN_NO_HUMANS,
            func = function( state )
                state.kickAllBots()
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                filter:AddAllPlayers()

                expect( filter:GetCount() ).to.equal( 0 )
                done()
            end
        }
    }
} )
