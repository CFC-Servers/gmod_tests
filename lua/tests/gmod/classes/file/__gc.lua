file.CreateDir("file_tests")
function GetTestFile( name, write )
	local f = file.Open( "file_tests/" .. name .. ".txt", write and "wb" or "rb", "DATA" )
	if !f then error( "Missing test file! (" .. name .. ")" ) end

	return f
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
