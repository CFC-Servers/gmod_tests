return WithBotTestTools( {
    groupName = "CRecipientFilter:RemoveRecipientsNotOnTeam",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemoveRecipientsNotOnTeam ).to.beA( "function" )
            end
        },

        {
            name = "Removes all players not on the given team from the filter",
            func = function( state )
                local teamNumber = 69

                local bots = state.addBots( 3 )
                local filter = RecipientFilter()
                filter:AddPlayers( bots )

                -- Set the team of the first two bots, but not the third
                bots[1]:SetTeam( teamNumber )
                bots[2]:SetTeam( teamNumber )
                bots[3]:SetTeam( teamNumber + 1 )

                filter:RemoveRecipientsNotOnTeam( teamNumber )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 2 )
            end
        }
    }
} )
