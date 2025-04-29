return {
    groupName = "Angle:SetUnpacked",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.SetUnpacked ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:SetUnpacked( 0, 0, 0 )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 1, 1, 1 )

                a:SetUnpacked( 0, 0, 0 )

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.equal( 0 )
                expect( y ).to.equal( 0 )
                expect( r ).to.equal( 0 )
            end
        },
        {
            name = "Fails when not given enough arguments",
            func = function()
                local a = Angle( 1, 1, 1 )

                local test = function()
                    a:SetUnpacked( 0 )
                end

                expect( test ).to.errWith( [[bad argument #2 to 'SetUnpacked' (number expected, got no value)]] )
            end
        }
    }
}
