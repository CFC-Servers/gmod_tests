return WithBotTestTools( {
    groupName = "CRecipientFilter:AddPVS",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddPVS ).to.beA( "function" )
            end
        },

        {
            name = "Adds targets from the PVS of the given vector",
            when = TestMap.IsRunningTestMap,
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

                -- Add only bots in the first room
                filter:AddPVS( firstRoom:GetPos() )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 1 )
                expect( added[1] ).to.equal( firstBot )

                done()
            end
        },

        {
            name = "Adds no targets if none exist in the given PAS",
            when = TestMap.IsRunningTestMap,
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

                filter:AddPVS( secondRoom:GetPos() )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 0 )

                done()
            end
        },

        {
            name = "Adds no targets if given an out-of-map position",
            when = TestMap.IsRunningTestMap,
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

                filter:AddPVS( Vector( 0, 0, -99999 ) )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 0 )

                done()
            end
        },
    }
} )
