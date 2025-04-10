return WithBotTestTools( {
    groupName = "CRecipientFilter:RemovePVS",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.RemovePVS ).to.beA( "function" )
            end
        },

        {
            name = "Removes targets from the PVS of the given vector",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                local firstRoom = TestMap:GetRoom( "pas_test_room_01" )
                local secondRoom = TestMap:GetRoom( "pas_test_room_02" )

                firstBot:SetPos( firstRoom:GetPos() )
                secondBot:SetPos( secondRoom:GetPos() )

                filter:AddAllPlayers()
                filter:RemovePVS( firstRoom:GetPos() )
                local remaining = filter:GetPlayers()

                expect( #remaining ).to.equal( 1 )
                expect( remaining[1] ).to.equal( secondBot )

                done()
            end
        },

        {
            name = "Removes no targets if none exist in the given PVS",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                local firstRoom = TestMap:GetRoom( "pas_test_room_01" )
                local secondRoom = TestMap:GetRoom( "pas_test_room_02" )

                firstBot:SetPos( firstRoom:GetPos() )
                secondBot:SetPos( firstRoom:GetPos() )

                filter:AddAllPlayers()
                filter:RemovePVS( secondRoom:GetPos() )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 2 )

                done()
            end
        },

        {
            name = "Removes no targets if given an out-of-map position",
            async = true,
            timeout = 1,
            coroutine = true,
            func = function( state )
                WaitForEmptyServer()
                expect( #player.GetAll() ).to.equal( 0 )

                local filter = RecipientFilter()
                local bots = state.addBots( 2 )

                local firstBot = bots[1]
                local secondBot = bots[2]

                local firstRoom = TestMap:GetRoom( "pas_test_room_01" )
                local secondRoom = TestMap:GetRoom( "pas_test_room_02" )

                firstBot:SetPos( firstRoom:GetPos() )
                secondBot:SetPos( secondRoom:GetPos() )

                filter:AddAllPlayers()
                filter:RemovePVS( Vector( 0, 0, -99999 ) )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 2 )

                done()
            end
        },
    }
} )
