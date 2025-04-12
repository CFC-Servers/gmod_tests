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
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local bots = state.addBots( 2 )

                local filter = RecipientFilter()
                filter:AddAllPlayers()

                local firstBot = bots[1]
                local secondBot = bots[2]
                filter:RemovePlayer( firstBot )

                local plys = filter:GetPlayers()
                expect( #plys ).to.equal( 1 )
                expect( plys[1] ).to.equal( secondBot )

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

                expect( filter.RemovePlayer, filter, NULL ).to.errWith( "Tried to use a NULL entity!" )
                expect( filter:GetCount() ).to.equal( 0 )

                done()
            end
        },

        {
            name = "Does nothing when removing a player not in the filter",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                filter:AddPlayer( firstBot )

                filter:RemovePlayer( secondBot )
                expect( filter:GetCount() ).to.equal( 1 )
                expect( filter:GetPlayers()[1] ).to.equal( firstBot )

                done()
            end
        },
    }
} )
