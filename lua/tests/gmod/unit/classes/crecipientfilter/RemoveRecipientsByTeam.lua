return WithBotTestTools( {
    groupName = "CRecipientFilter:RemoveRecipientsByTeam",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemoveRecipientsByTeam ).to.beA( "function" )
            end
        },

        {
            name = "Removes all players on the given team from the filter",
            func = function( state )
                local teamNumber = 69

                local bots = state.addBots( 2 )
                local filter = RecipientFilter()
                filter:AddPlayers( bots )

                for _, bot in ipairs( bots ) do
                    bot:SetTeam( teamNumber )
                    expect( bot:Team() ).to.equal( teamNumber )
                end

                filter:RemoveRecipientsByTeam( teamNumber )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 0 )
            end
        },

        {
            name = "Does nothing when given a team with no players",
            func = function( state )
                local bots = state.addBots( 2 )
                local filter = RecipientFilter()
                filter:AddPlayers( bots )

                filter:RemoveRecipientsByTeam( 32000 )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( #bots )
            end
        },
    }
} )
