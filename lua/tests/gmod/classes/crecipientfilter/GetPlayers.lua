return WithBotTestTools( {
    groupName = "CRecipientFilter:GetPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.GetPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Returns a table of the players in the CRecipientFilter",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 3
                local filter = RecipientFilter()

                local bots = state.addBots( botCount )
                filter:AddAllPlayers()

                local added = filter:GetPlayers()
                expect( filter:GetCount() ).to.equal( botCount )
                expect( added ).to.deepEqual( bots )

                done()
            end
        },

        {
            name = "Returns an empty table for an empty CRecipientFilter",
            func = function()
                local filter = RecipientFilter()
                expect( filter:GetPlayers() ).to.deepEqual( {} )
            end
        }
    }
} )
