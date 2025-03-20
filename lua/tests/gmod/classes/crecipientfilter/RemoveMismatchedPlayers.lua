return WithBotTestTools( {
    groupName = "CRecipientFilter:RemoveMismatchedPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemoveMismatchedPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Removes mismatched players from the CRecipientFilter when given a CRecipientFilter",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 4
                local filter1 = RecipientFilter()
                local bots = state.addBots( botCount )

                filter1:AddAllPlayers()
                expect( filter1:GetCount() ).to.equal( botCount )

                local filter2 = RecipientFilter()
                local bots2 = { bots[3], bots[4] }
                filter2:AddPlayers( bots2 )

                filter1:RemoveMismatchedPlayers( filter2 )
                expect( filter2:GetCount() ).to.equal( 2 )

                local filter1Contents = filter1:GetPlayers()
                expect( filter1Contents[1] ).to.equal( bots[3] )
                expect( filter1Contents[2] ).to.equal( bots[4] )

                done()
            end
        },

        {
            name = "Removes mismatched players from the CRecipientFilter when given a table of players",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 4
                local filter1 = RecipientFilter()
                local bots = state.addBots( botCount )

                filter1:AddAllPlayers()
                expect( filter1:GetCount() ).to.equal( botCount )

                local filter2 = RecipientFilter()
                local bots2 = { bots[3], bots[4] }
                filter2:AddPlayers( bots2 )

                filter1:RemoveMismatchedPlayers( bots2 )
                expect( filter2:GetCount() ).to.equal( 2 )

                local filter1Contents = filter1:GetPlayers()
                expect( filter1Contents[1] ).to.equal( bots[3] )
                expect( filter1Contents[2] ).to.equal( bots[4] )

                done()
            end
        },

        {
            name = "Clears the given CRecipientFilter when given an empty table",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 4
                local filter1 = RecipientFilter()
                state.addBots( botCount )

                filter1:AddAllPlayers()
                expect( filter1:GetCount() ).to.equal( botCount )

                filter1:RemoveMismatchedPlayers( {} )
                expect( filter1:GetCount() ).to.equal( 0 )

                done()
            end
        },

    }
} )
