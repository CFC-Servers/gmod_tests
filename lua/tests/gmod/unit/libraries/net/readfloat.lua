return WithTestEntity( {
    groupName = "net.ReadFloat",
    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( net.ReadFloat ).to.beA( "function" )
            end
        },
        {
            name = "Returns the right value",
            when = holytest ~= nil,
            func = function()
                local writeBuffer, defaultSize = CreateLuaNetWriteBuffer( 128, "gmod_test_ReceiveTest" )

                -- Message content
                writeBuffer:WriteFloat( 12.34 )

                local receivePlayer = player.GetAll()[1]
                net.Receive( "gmod_test_ReceiveTest", function( len, ply )
                    len = len - defaultSize -- Removed as its part of the outside message

                    expect( receivePlayer ).to.equal( ply )
                    expect( len ).to.equal( 16 ) -- We wrote 16 bits

                    expect( net.ReadFloat() ).to.equal( 12.34 )

                    expect( net.ReadFloat() ).to.equal( 0 ) -- Returns 0 on failure
                end )

                SendBufferAsNetMessage( receivePlayer, writeBuffer )
            end
        },
    }
} )