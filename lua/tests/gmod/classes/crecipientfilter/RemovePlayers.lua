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
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()

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

                done()
            end
        },

        {
            name = "Removes a table of players",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()

                local bots = state.addBots( 3 )
                local filter = RecipientFilter()
                filter:AddAllPlayers()

                filter:RemovePlayers( { bots[1], bots[2] } )

                local addedPlayers = filter:GetPlayers()
                expect( #addedPlayers ).to.equal( 1 )
                expect( addedPlayers[1] ).to.equal( bots[3] )

                done()
            end
        },

        -- This is fun behavior - may be unexpected?
        {
            name = "Removes everything up to the first not-player entry",
            async = true,
            timeout = 2,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()

                local filter = RecipientFilter()
                local bots = state.addBots( 3 )
                filter:AddAllPlayers()

                local tbl = { bots[1], bots[2], "not a player", bots[3] }

                filter:RemovePlayers( tbl )
                expect( filter:GetCount() ).to.equal( 1 )
                expect( filter:GetPlayers()[1] ).to.equal( bots[3] )

                done()
            end
        },

        {
            name = "Does nothing when given an empty table",
            async = true,
            timeout = 2,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )
                filter:AddAllPlayers()

                filter:RemovePlayers( {} )
                expect( filter:GetCount() ).to.equal( #bots )

                done()
            end
        },
    }
} )
