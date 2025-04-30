return WithBotTestTools( {
    groupName = "CRecipientFilter:AddRecipientsByTeam",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddRecipientsByTeam ).to.beA( "function" )
            end
        },

        {
            name = "Adds all players on the given team to the filter",
            func = function( state )
                local teamNumber = 80

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )
                for _, bot in ipairs( bots ) do
                    bot:SetTeam( teamNumber )
                    expect( bot:Team() ).to.equal( teamNumber )
                end

                filter:AddRecipientsByTeam( teamNumber )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 2 )
            end
        },

        {
            name = "Does nothing when given a team with no players",
            func = function( state )
                local filter = RecipientFilter()
                state.addBots( 2 )

                filter:AddRecipientsByTeam( 32000 )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 0 )
            end
        },
    }
} )
