return WithTestEntity( {
    groupName = "Entity:Blocked",

    cases = {
        {
            name = "Exists on the Entity metatable",

            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.Blocked ).to.beA( "function" )
            end
        },

        {
            name = "Does not error when called with the World entity",

            func = function( state )
                local ent = state.ent

                local function test()
                    ent:Blocked( Entity( 0 ) )
                end

                expect( test ).to.succeed()
            end
        },

        {
            name = "Errors when called with no arguments",

            func = function( state )
                local ent = state.ent

                local function test()
                    ent:Blocked()
                end

                expect( test ).to.errWith( [[bad argument #1 to 'Blocked' (Entity expected, got no value)]] )
            end
        },

        {
            name = "Errors when given an Invalid Entity",

            func = function( state )
                local ent = state.ent

                local function test()
                    ent:Blocked( Entity( 9999 ) )
                end

                expect( test ).to.errWith( [[Tried to use a NULL entity!]] )
            end
        },

        -- TODO:
        -- Test with func_movelinear
    }
} )
