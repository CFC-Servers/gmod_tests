return WithTestEntity( {
    groupName = "net.ReadEntity",
    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( net.ReadEntity ).to.beA( "function" )
            end
        },
        {
            name = "Returns the right value",
            when = holytest ~= nil,
            func = function()
                local writeBuffer, defaultSize = CreateLuaNetWriteBuffer( 128, "gmod_test_ReceiveTest" )

                -- Message content
                local receivePlayer = player.GetAll()[1]
                writeBuffer:WriteUBitLong( receivePlayer:EntIndex(), MAX_EDICT_BITS )
                
                net.Receive( "gmod_test_ReceiveTest", function( len, ply )
                    len = len - defaultSize -- Removed as its part of the outside message

                    expect( receivePlayer ).to.equal( ply )
                    expect( len ).to.equal( MAX_EDICT_BITS )

                    expect( net.ReadEntity() ).to.equal( receivePlayer )

                    expect( net.ReadEntity() ).to.beNil() -- Returns nil on failure
                end )

                SendBufferAsNetMessage( receivePlayer, writeBuffer )
            end
        },
    }
} )