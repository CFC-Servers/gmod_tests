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
            func = function( state )
                local botCount = 4
                local filter1 = RecipientFilter()
                local bots = state.addBots( botCount )

                filter1:AddPlayers( bots )
                expect( filter1:GetCount() ).to.equal( botCount )

                local filter2 = RecipientFilter()
                local bots2 = { bots[3], bots[4] }
                filter2:AddPlayers( bots2 )

                filter1:RemoveMismatchedPlayers( filter2 )
                expect( filter2:GetCount() ).to.equal( 2 )

                local filter1Contents = filter1:GetPlayers()
                expect( filter1Contents[1] ).to.equal( bots[3] )
                expect( filter1Contents[2] ).to.equal( bots[4] )
            end
        },

        {
            name = "Removes mismatched players from the CRecipientFilter when given a table of players",
            func = function( state )
                local botCount = 4
                local filter1 = RecipientFilter()
                local bots = state.addBots( botCount )

                filter1:AddPlayers( bots )
                expect( filter1:GetCount() ).to.equal( botCount )

                local filter2 = RecipientFilter()
                local bots2 = { bots[3], bots[4] }
                filter2:AddPlayers( bots2 )

                filter1:RemoveMismatchedPlayers( bots2 )
                expect( filter2:GetCount() ).to.equal( 2 )

                local filter1Contents = filter1:GetPlayers()
                expect( filter1Contents[1] ).to.equal( bots[3] )
                expect( filter1Contents[2] ).to.equal( bots[4] )
            end
        },

        {
            name = "Clears the given CRecipientFilter when given an empty table",
            func = function( state )
                local botCount = 4
                local filter1 = RecipientFilter()
                local bots = state.addBots( botCount )

                filter1:AddPlayers( bots )
                expect( filter1:GetCount() ).to.equal( botCount )

                filter1:RemoveMismatchedPlayers( {} )
                expect( filter1:GetCount() ).to.equal( 0 )
            end
        },

    }
} )
