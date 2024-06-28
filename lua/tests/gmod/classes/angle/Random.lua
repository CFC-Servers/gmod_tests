return {
    groupName = "Angle:Random",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Random ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 1, 1, 1 )

                local out = a:Random()
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 0, 0, 0 )

                a:Random()

                local p, y, r = a[1], a[2], a[3]
                expect( p ).to.beA( "number" )
                expect( y ).to.beA( "number" )
                expect( r ).to.beA( "number" )
            end
        },

        {
            name = "Accepts numeric string arguments",
            func = function()
                local a = Angle( 0, 0, 0 )

                local test = function()
                    a:Random( "1", "2" )
                end

                expect( test ).to.succeed()
            end
        },
        {
            name = "Fails when given a non-numeric string for min parameter",
            func = function()
                local a = Angle( 0, 0, 0 )

                local test = function()
                    a:Random( "a", 5 )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'Random' (number expected, got string)]] )
            end
        },
        {
            name = "Fails when given a non-numeric string for max parameter",
            func = function()
                local a = Angle( 0, 0, 0 )

                local test = function()
                    a:Random( 5, "a" )
                end

                expect( test ).to.errWith( [[bad argument #2 to 'Random' (number expected, got string)]] )
            end
        }
    }
}
