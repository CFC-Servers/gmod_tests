return WithBotTestTools( {
    groupName = "CRecipientFilter:AddPlayer",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddPlayer ).to.beA( "function" )
            end
        },

        {
            name = "Adds the targeted player to the filter",
            func = function( state )
                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local myBot = bots[1]
                filter:AddPlayer( myBot )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 1 )
                expect( plys[1] ).to.equal( myBot )
            end
        },

        {
            name = "Errors when given NULL",
            func = function()
                local filter = RecipientFilter()

                expect( filter.AddPlayer, filter, NULL ).to.errWith( "Tried to use a NULL entity!" )
                expect( filter:GetCount() ).to.equal( 0 )
            end
        },

        {
            name = "Does not add duplicate players",
            func = function( state )
                local filter = RecipientFilter()
                local bots = state.addBots( 1 )
                local myBot = bots[1]

                filter:AddPlayer( myBot )
                expect( filter:GetCount() ).to.equal( 1 )

                filter:AddPlayer( myBot )
                expect( filter:GetCount() ).to.equal( 1 )
            end
        },
    }
} )
