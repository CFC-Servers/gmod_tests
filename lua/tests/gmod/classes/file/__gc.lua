file.CreateDir("file_tests")
local data = {
	Write = "Hello World\nHello World2",
	WriteBool = true,
	WriteByte = 123,
	WriteDouble = 1.0000000000001,
	WriteFloat = 1.0000001,
	WriteLong = 2100000000,
	WriteShort = 32000,
	WriteUInt64 = 18000000000000000000,
	WriteULong = 4200000000,
	WriteUShort = 64000,
}

function GetTestFile( name, write )
	local f = file.Open( "file_tests/" .. name .. ".txt", write and "wb" or "rb", "DATA" )
	if !f then error( "Missing test file! (" .. name .. ")" ) end

	return f
end

local meta = FindMetaTable( "File" )
for func, val in pairs( data ) do
	local f = GetTestFile( func, true )

	meta[func](f, val)
	f:Close()
end

return {
    groupName = "File:__gc",

    cases = {
        {
            name = "Exists on the File meta table",
            func = function()
                local meta = FindMetaTable( "File" )
                expect( meta.__gc ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestFile( "__gc", true )

                expect( a:__tostring() ).to.equal( "File" )

                a:__gc()

                expect( a:__tostring() ).to.equal( "File [NULL]" )
            end
        },
    }
}
