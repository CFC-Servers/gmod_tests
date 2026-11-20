return WithTestEntity( {
    groupName = "net.ReadData",
    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( net.ReadData ).to.beA( "function" )
            end
        },
        {
            name = "Returns the right value",
            when = holytest ~= nil,
            func = function()
                local writeBuffer, defaultSize = CreateLuaNetWriteBuffer( 128, "gmod_test_ReceiveTest" )

                -- Message content (with a random null byte)
                local testData = "12345-Hello World-" .. string.char(0) .. "-12345"
                writeBuffer:WriteBytes( testData )

                local receivePlayer = player.GetAll()[1]
                net.Receive( "gmod_test_ReceiveTest", function( len, ply )
                    len = len - defaultSize -- Removed as its part of the outside message

                    expect( receivePlayer ).to.equal( ply )
                    expect( len ).to.equal( testData:len() * 8 )

                    expect( net.ReadData( testData:len() ) ).to.equal( testData )

                    expect( net.ReadData( 123 ) ).to.equal( string.char(0) ) -- Returns an null byte string on failure
                end )

                SendBufferAsNetMessage( receivePlayer, writeBuffer )
            end
        },
    }
} )