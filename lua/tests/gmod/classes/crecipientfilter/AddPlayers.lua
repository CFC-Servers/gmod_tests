return WithBotTestTools( {
    groupName = "CRecipientFilter:AddPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Adds the contents of one CRecipientFilter to another",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local bots = state.addBots( 3 )

                local filter1 = RecipientFilter()
                local filter2 = RecipientFilter()

                filter1:AddPlayer( bots[1] )
                filter1:AddPlayer( bots[2] )
                expect( #filter1:GetPlayers() ).to.equal( 2 )

                filter2:AddPlayers( filter1 )
                local addedPlayers = filter2:GetPlayers()
                expect( #addedPlayers ).to.equal( 2 )
                expect( addedPlayers ).to.deepEqual( filter1:GetPlayers() )

                done()
            end
        },

        {
            name = "Adds a table of players",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local bots = state.addBots( 3 )
                local filter = RecipientFilter()

                filter:AddPlayers( bots )
                local addedPlayers = filter:GetPlayers()

                expect( #addedPlayers ).to.equal( 3 )
                expect( addedPlayers ).to.deepEqual( bots )

                done()
            end
        },

        -- This is fun behavior - may be unexpected?
        {
            name = "Adds everything up to the first not-player entry",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local bots = state.addBots( 3 )
                local tbl = { bots[1], bots[2], "not a player", bots[3] }

                local filter = RecipientFilter()
                filter:AddPlayers( tbl )
                expect( filter:GetCount() ).to.equal( 2 )
                expect( filter:GetPlayers() ).to.deepEqual( { bots[1], bots[2] } )

                done()
            end
        },

        {
            name = "Does nothing when given an empty table",
            func = function()
                local filter = RecipientFilter()
                filter:AddPlayers( {} )
                expect( filter:GetCount() ).to.equal( 0 )
            end
        },
    }
} )
