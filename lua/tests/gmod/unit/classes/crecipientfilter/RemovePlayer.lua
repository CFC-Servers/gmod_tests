return WithBotTestTools( {
    groupName = "CRecipientFilter:RemovePlayer",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemovePlayer ).to.beA( "function" )
            end
        },

        {
            name = "Removes the targeted player from the filter",
            func = function( state )
                local bots = state.addBots( 2 )

                local filter = RecipientFilter()
                filter:AddPlayers( bots )

                local firstBot = bots[1]
                local secondBot = bots[2]
                filter:RemovePlayer( firstBot )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 1 )
                expect( plys[1] ).to.equal( secondBot )
            end
        },

        {
            name = "Errors when given NULL",
            func = function()
                local filter = RecipientFilter()

                expect( filter.RemovePlayer, filter, NULL ).to.errWith( "Tried to use a NULL entity!" )
                expect( filter:GetCount() ).to.equal( 0 )
            end
        },

        {
            name = "Does nothing when removing a player not in the filter",
            func = function( state )
                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                filter:AddPlayer( firstBot )

                filter:RemovePlayer( secondBot )
                expect( filter:GetCount() ).to.equal( 1 )
                expect( filter:GetPlayers()[1] ).to.equal( firstBot )
            end
        },
    }
} )
