return WithBotTestTools( {
    groupName = "CRecipientFilter:RemoveAllPlayers",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemoveAllPlayers ).to.beA( "function" )
            end
        },

        {
            name = "Removes all players from the CRecipientFilter",
            async = true,
            timeout = 2,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 3
                local filter = RecipientFilter()
                state.addBots( botCount )

                filter:AddAllPlayers()
                expect( filter:GetCount() ).to.equal( botCount )

                filter:RemoveAllPlayers()
                expect( filter:GetCount() ).to.equal( 0 )

                done()
            end
        },

        {
            name = "Does nothing on an empty CRecipientFilter",
            func = function()
                local filter = RecipientFilter()
                filter:RemoveAllPlayers()

                expect( filter:GetCount() ).to.equal( 0 )
            end
        }
    }
} )
