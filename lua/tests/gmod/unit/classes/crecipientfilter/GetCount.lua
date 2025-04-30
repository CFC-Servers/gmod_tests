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
            func = function( state )
                local botCount = 3
                local filter = RecipientFilter()

                local bots = state.addBots( botCount )
                filter:AddPlayers( bots )

                expect( filter:GetCount() ).to.equal( botCount )
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
