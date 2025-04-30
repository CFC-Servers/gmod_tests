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
            func = function( state )
                local botCount = 3
                local filter = RecipientFilter()
                local bots = state.addBots( botCount )

                filter:AddPlayers( bots )
                expect( filter:GetCount() ).to.equal( botCount )

                filter:RemoveAllPlayers()
                expect( filter:GetCount() ).to.equal( 0 )
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
