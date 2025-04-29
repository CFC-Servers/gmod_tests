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
            async = true,
            timeout = 2,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()

                local teamNumber = 69

                local bots = state.addBots( 2 )
                local filter = RecipientFilter()
                filter:AddAllPlayers()

                for _, bot in ipairs( bots ) do
                    bot:SetTeam( teamNumber )
                    expect( bot:Team() ).to.equal( teamNumber )
                end

                filter:RemoveRecipientsByTeam( teamNumber )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 0 )

                done()
            end
        },

        {
            name = "Does nothing when given a team with no players",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local bots = state.addBots( 2 )
                local filter = RecipientFilter()
                filter:AddAllPlayers()

                filter:RemoveRecipientsByTeam( 32000 )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( #bots )

                done()
            end
        },
    }
} )
