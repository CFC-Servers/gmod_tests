return{
    groupName = "Angle:Add",

    cases = {
        {
            name = "Exists in Angle metatable",
            func = function()
                local metatable = FindMetaTable( "Angle" )
                expect( metatable.Add ).to.beA( "function" )
            end
        },
        
    }
}