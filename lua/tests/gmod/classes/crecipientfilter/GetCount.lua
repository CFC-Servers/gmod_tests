return WithBotTestTools( {
    groupName = "CRecipientFilter:GetCount",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.GetCount ).to.beA( "function" )
            end
        },

        {
            name = "Returns the number of players in the filter",
            async = true,
            timeout = 3,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local botCount = 3
                local filter = RecipientFilter()

                state.addBots( botCount )
                filter:AddAllPlayers()

                expect( filter:GetCount() ).to.equal( botCount )

                done()
            end
        },

        {
            name = "Returns 0 for an empty CRecipientFilter",
            func = function()
                local filter = RecipientFilter()
                expect( filter:GetCount() ).to.equal( 0 )
            end
        }
    }
} )
