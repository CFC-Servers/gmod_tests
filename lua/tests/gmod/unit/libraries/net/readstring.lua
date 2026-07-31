return WithTestEntity( {
    groupName = "net.ReadString",
    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( net.ReadString ).to.beA( "function" )
            end
        },
        {
            name = "Returns the right value",
            when = holytest ~= nil,
            func = function()
                local writeBuffer, defaultSize = CreateLuaNetWriteBuffer( 128, "gmod_test_ReceiveTest" )

                -- Message content
                local testMessage = "Hello World"
                writeBuffer:WriteString( testMessage )

                local receivePlayer = player.GetAll()[1]
                net.Receive( "gmod_test_ReceiveTest", function( len, ply )
                    len = len - defaultSize -- Removed as its part of the outside message

                    expect( receivePlayer ).to.equal( ply )
                    expect( len ).to.equal( ( testMessage:len() + 1 ) * 8 ) -- + 1 due to null terminator byte

                    expect( net.ReadString() ).to.equal( testMessage )

                    expect( net.ReadString() ).to.equal( "" ) -- Returns an empty string when nothing could be read
                end )

                SendBufferAsNetMessage( receivePlayer, writeBuffer )
            end
        },
    }
} )