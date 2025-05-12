local testPath = "gmod_tests_file_tests"
file.CreateDir( testPath )

--- @param name string The name of the file in the test directory
--- @param write boolean? Whether or not to open the File in "write" mode
--- @return File f The File object
--- @return string path The full path to the file
local function getTestFile( name, write )
    local path = testPath .. "/" .. name .. ".txt"
    local mode = write and "wb" or "rb"

    -- Create the directory if it doesn't exist
    if not file.Exists( path, "DATA" ) then
        file.Write( path, "" )
    end

    local f = file.Open( path, mode, "DATA" ) --[[@as File]]
    if not f then error( "Failed to get test file: " .. path ) end

    return f, path
end

local function recursiveDelete( path )
    local files, folders = file.Find( path .. "/*", "DATA" )
    for _, fileName in ipairs( files ) do
        file.Delete( path .. "/" .. fileName )
    end

    for _, folderName in ipairs( folders ) do
        recursiveDelete( path .. "/" .. folderName )
    end

    file.Delete( path )
end

local function getNewFileState()
    --- @class GmodTests_FileState
    local fileState = {}

    --- @class FileInfo
    --- @field file File The file object
    --- @field path string The path to the file

    --- @type FileInfo[]
    fileState.files = {}

    --- Returns a new File object for use in the gmod_tests test suite
    --- @param name string The name of the file in the test directory
    --- @param write boolean? Whether or not to open the File in "write" mode
    --- @return File f The File object
    function fileState.getTestFile( name, write )
        local f, path = getTestFile( name, write )

        --- @type FileInfo
        local fileInfo = { file = f, path = path }
        table.insert( fileState.files, fileInfo )

        return f
    end

    return fileState
end

--- @class GmodTests_TestCaseWithFileTools: GLuaTest_TestCase
--- @field func fun(state: GmodTests_FileState): nil The test function
--- @field cleanup? fun(state: GmodTests_FileState): nil? A function to run after the test, regardless of the test outcome

--- @class GmodTests_TestGroupWithFileTools: GLuaTest_TestGroup
--- @field cases GmodTests_TestCaseWithFileTools[] The test cases in this group
--- @field beforeAll? fun(state: GmodTests_FileState): nil A function to run before all tests in the group
--- @field beforeEach? fun(state: GmodTests_FileState): nil A function to run before each test in the group
--- @field afterAll? fun(state: GmodTests_FileState): nil A function to run after all tests in the group
--- @field afterEach? fun(state: GmodTests_FileState): nil A function to run after each test in the group

--- Sets up a testGroup to inject self-cleaning file tools to each test case
--- @param testGroup GmodTests_TestGroupWithFileTools The test group to set up
--- @return GmodTests_TestGroupWithFileTools The test group with file tools set up
WithFileTestTools = function( testGroup )
    local _beforeEach = testGroup.beforeEach
    testGroup.beforeEach = function( state )
        table.Merge( state, getNewFileState() )

        if _beforeEach then _beforeEach( state ) end
    end

    local _afterEach = testGroup.afterEach
    testGroup.afterEach = function( state )
        if not state.files then return end

        for _, fileInfo in ipairs( state.files ) do
            local f = fileInfo.file

            if IsValid( f ) then
                f:Close()
            end

            file.Delete( fileInfo.path )
        end

        if _afterEach then _afterEach( state ) end
    end

    return testGroup
end

-- Cleanup the test dir after the tests are done
hook.Add( "GLuaTest_Finished", "GmodTests_FileToolsCleanup", function()
    -- Remove all test files
    recursiveDelete( testPath )

    -- Remove the test directory
    file.Delete( testPath )
end )
