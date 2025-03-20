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
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local myBot = bots[1]
                filter:AddPlayer( myBot )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 1 )
                expect( plys[1] ).to.equal( myBot )

                done()
            end
        },

        {
            name = "Errors when given NULL",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function()
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()

                expect( filter.AddPlayer, filter, NULL ).to.errWith( "Tried to use a NULL entity!" )
                expect( filter:GetCount() ).to.equal( 0 )

                done()
            end
        },

        {
            name = "Does not add duplicate players",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 1 )
                local myBot = bots[1]

                filter:AddPlayer( myBot )
                expect( filter:GetCount() ).to.equal( 1 )

                filter:AddPlayer( myBot )
                expect( filter:GetCount() ).to.equal( 1 )

                done()
            end
        },
    }
} )
