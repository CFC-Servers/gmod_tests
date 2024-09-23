return WithTestEntity( {
    groupName = "Entity:AlignAngles",

    cases = {
        {
            name = "Exists on the Entity metatable",

            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.AlignAngles ).to.beA( "function" )
            end
        },

        {
            name = "Returns the expected value when given two Angles",

            func = function( state )
                local ent = state.ent
                local ang1 = Angle( 0, 2, 0 )
                local ang2 = Angle( 0, 0, 0 )

                local result = ent:AlignAngles( ang1, ang2 )
                local p, y, r = result:Unpack()

                expect( p ).to.aboutEqual( 0 )
                expect( y ).to.aboutEqual( -2 )
                expect( r ).to.aboutEqual( 0 )
            end
        },
    }
} )
