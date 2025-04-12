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
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local teamNumber = 69

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )
                for _, bot in ipairs( bots ) do
                    bot:SetTeam( teamNumber )
                    expect( bot:Team() ).to.equal( teamNumber )
                end

                filter:AddRecipientsByTeam( teamNumber )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 2 )

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

                local filter = RecipientFilter()
                state.addBots( 2 )

                filter:AddRecipientsByTeam( 32000 )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 0 )

                done()
            end
        },
    }
} )
