return WithBotTestTools( {
    groupName = "CRecipientFilter:RemovePlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemovePlayers ).to.beA( "function" )
            end
        },

        {
            name = "Removes the contents of one CRecipientFilter from another",
            func = function( state )
                local bots = state.addBots( 3 )

                local filter1 = RecipientFilter()
                local filter2 = RecipientFilter()

                filter1:AddPlayer( bots[1] )
                filter1:AddPlayer( bots[2] )
                filter2:AddPlayer( bots[2] )

                -- Should remove bots[2]
                filter1:RemovePlayers( filter2 )

                local remainingPlayers = filter1:GetPlayers()
                expect( #remainingPlayers ).to.equal( 1 )
                expect( remainingPlayers[1] ).to.equal( bots[1] )
            end
        },

        {
            name = "Removes a table of players",
            func = function( state )
                local bots = state.addBots( 3 )
                local filter = RecipientFilter()
                filter:AddPlayers( bots )

                filter:RemovePlayers( { bots[1], bots[2] } )

                local addedPlayers = filter:GetPlayers()
                expect( #addedPlayers ).to.equal( 1 )
                expect( addedPlayers[1] ).to.equal( bots[3] )
            end
        },

        -- This is fun behavior - may be unexpected?
        {
            name = "Removes everything up to the first not-player entry",
            func = function( state )
                local filter = RecipientFilter()
                local bots = state.addBots( 3 )
                filter:AddPlayers( bots )

                local tbl = { bots[1], bots[2], "not a player", bots[3] }

                filter:RemovePlayers( tbl )
                expect( filter:GetCount() ).to.equal( 1 )
                expect( filter:GetPlayers()[1] ).to.equal( bots[3] )
            end
        },

        {
            name = "Does nothing when given an empty table",
            func = function( state )
                local filter = RecipientFilter()
                local bots = state.addBots( 2 )
                filter:AddPlayers( bots )

                filter:RemovePlayers( {} )
                expect( filter:GetCount() ).to.equal( #bots )
            end
        },
    }
} )
