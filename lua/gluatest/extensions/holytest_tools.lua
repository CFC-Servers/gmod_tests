AddCSLuaFile()

-- Helper function in case the setup required changes in the future
function CreateLuaNetWriteBuffer( size, messageName )
	size = size or 128 -- 128 bytes by default

	local writeBuffer = bitbuf.CreateWriteBuffer( 128 )
    writeBuffer:WriteUBitLong( 0, 8 ) -- The message type. 0 = Lua net message

    -- This is the default size of the outside net message.
    -- net.Receive's len argument still includes this but these are not part the Lua net message and for testing, we remove these
    local defaultSize = writeBuffer:GetNumBitsWritten()

    -- Header for net.ReadHeader
    -- We don't include it in defaultSize since inside net.Income the len argument is updated to remove these 16 bits
    writeBuffer:WriteUBitLong( util.AddNetworkString( messageName ), 16 )

    return writeBuffer, defaultSize
end

function SendBufferAsNetMessage( receivePlayer, writeBuffer )
	local userID = receivePlayer:IsPlayer() and receivePlayer:UserID() or -1
	local readBuffer = bitbuf.CreateReadBuffer( writeBuffer:GetData() )
	holytest.ReceiveClientMessage( userID, receivePlayer, readBuffer, readBuffer:GetNumBits() )
end

-- For use when wanting to write for example a table using net.WriteTable
-- NOTE: Tests for net.Write* cannot be made as currently we do not have a way to properly test the written buffer.
function HookBufferIntoNetWriteFunctions( writeBuffer )
	_original_net = _original_net or {}

	for name, func in ipairs(net) do
		if not name:StartsWith("Write") then continue end
		if _original_net[name] then continue end

		_original_net[name] = func
	end

	net.WriteString = function( val )
		writeBuffer:WriteString( val )
	end

	net.WriteData = function( val )
		writeBuffer:WriteData( val )
	end

	net.WriteBit = function( val )
		writeBuffer:WriteOneBit( val )
	end

	net.WriteInt = function( val, bits )
		writeBuffer:WriteBitLong( val, bits )
	end

	net.WriteUInt = function( val, bits )
		writeBuffer:WriteUBitLong( val, bits )
	end

	net.WriteNormal = function( val )
		writeBuffer:WriteBitVec3Normal( val )
	end

	net.WriteVector = function( val )
		writeBuffer:WriteBitVec3Coord( val )
	end

	net.WriteAngle = function( val )
		writeBuffer:WriteBitAngles( val )
	end

	net.WriteDouble = function( val )
		writeBuffer:WriteDouble( val )
	end

	net.WriteUInt64 = function( val )
		writeBuffer:WriteVarInt64( val )
	end

	net.WriteMatrix = function( val )
		writeBuffer:WriteVMatrix( val )
	end
end

function RemoveHookFromNetWriteFunctions()
	for name, func in ipairs(_original_net) do
		if not name:StartsWith("Write") then continue end

		net[name] = func
	end
end