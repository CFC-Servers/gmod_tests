return WithBotTestTools( {
    groupName = "CRecipientFilter:AddPAS",

    cases = {
        {
            name = "Exists on the CRecipientFilter metatable",
            func = function()
                local meta = assert( FindMetaTable( "CRecipientFilter" ) )
                expect( meta.AddPAS ).to.beA( "function" )
            end
        },

        {
            name = "Adds targets from the PAS of the given vector",
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
                filter:AddPAS( firstRoom:GetPos() )
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

                filter:AddPAS( secondRoom:GetPos() )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 0 )

                done()
            end
        },

        -- TODO: Is this map-specific somehow? Seemed to not do this on gm_construct
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

                filter:AddPAS( Vector( 0, 0, -99999 ) )
                local added = filter:GetPlayers()

                expect( #added ).to.equal( 0 )

                done()
            end
        },
    }
} )
