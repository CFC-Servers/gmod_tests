return {
    groupName = "Angle:Div",
    cases = {
        {
            name = "Exits on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Div ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 2, 2, 2 )

                local out = a:Div( 2 )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 2, 2, 2 )

                a:Div( 2 )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 1 )
                expect( y1 ).to.equal( 1 )
                expect( r1 ).to.equal( 1 )
            end
        },

        {
            name = "Works when given a negative number",
            func = function()
                local a = Angle( 2, 2, 2 )

                a:Div( -2 )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( -1 )
                expect( y1 ).to.equal( -1 )
                expect( r1 ).to.equal( -1 )
            end
        },

        {
            name = "Functions correctly when given a numeric string",
            func = function()
                local a = Angle( 2, 2, 2 )

                a:Div( "2" )
                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 1 )
                expect( y1 ).to.equal( 1 )
                expect( r1 ).to.equal( 1 )
            end
        },
        {
            name = "Errors when given a non-numeric string",
            func = function()
                local a = Angle( 2, 2, 2 )

                local test = function()
                    a:Div( "a" )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'Div' (number expected, got string)]] )
            end
        },

    }
}
