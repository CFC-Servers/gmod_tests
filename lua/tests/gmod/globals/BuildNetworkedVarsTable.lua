return {
    groupName = "Global:BuildNetworkedVarsTable",
    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( BuildNetworkedVarsTable ).to.beA( "function" )
            end
        },

        {
            name = "Returns a table",
            func = function()
                local result = BuildNetworkedVarsTable()
                expect( result ).to.beA( "table" )
            end
        },

        {
            name = "Builds and returns networked vars",
            func = function()
                local key = "BuildNetworkedVarsTableTest"
                local value = "test value"
                SetGlobalString( key, value )

                local result = BuildNetworkedVarsTable()
                expect( result[0][key] ).to.equal( value )
            end,

            cleanup = function()
                SetGlobalString( "BuildNetworkedVarsTableTest", nil )
            end
        }
    }
}
