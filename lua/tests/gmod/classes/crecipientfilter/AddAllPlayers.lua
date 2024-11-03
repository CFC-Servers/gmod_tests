return WithBotTestTools( {
    groupName = "CRecipientFilter:AddAllPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = FindMetaTable( "CRecipientFilter" )
                expect( meta.AddAllPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Adds all currently connected players",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForTicks( 10 ) -- Wait for the bots to actually disconnect

                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 3 )
                local botLookup = {} do
                    for i = 1, #bots do
                        botLookup[bots[i]] = true
                    end
                end

                filter:AddAllPlayers()

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 3 )

                for i = 1, #plys do
                    local ply = plys[i]
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
            func = function()
                WaitForTicks( 10 ) -- Wait for the bots to actually disconnect

                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                filter:AddAllPlayers()

                expect( filter:GetCount() ).to.equal( 0 )
                done()
            end
        }
    }
} )
