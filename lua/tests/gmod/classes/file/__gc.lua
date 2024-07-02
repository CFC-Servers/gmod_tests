local testPath = "file_tests"
file.CreateDir(testPath)

--- Returns a new File object for use in the gmod_tests test suite
--- @param name string The name of the file in the test directory
--- @param write boolean Whether or not to open the File in "write" mode
--- @returns File
function GetTestFile( name, write )
	local path = testPath .. "/" .. name .. ".txt"
	local mode = write and "wb" or "rb"

	local f = file.Open( path, mode, "DATA" )
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
