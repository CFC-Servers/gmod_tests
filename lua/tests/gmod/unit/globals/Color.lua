return {
    groupName = "Global:Color",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( Color ).to.beA( "function" )
            end
        },

        {
            name = "Returns a table with the Color metatable",
            func = function()
                local color = Color( 1, 2, 3, 4 )
                expect( color ).to.beA( "table" )
                expect( debug.getmetatable( color ) ).to.equal( FindMetaTable( "Color" ) )

                expect( color.r ).to.equal( 1 )
                expect( color.g ).to.equal( 2 )
                expect( color.b ).to.equal( 3 )
                expect( color.a ).to.equal( 4 )
            end
        },

        {
            name = "Accepts string-number parameters",
            func = function()
                local color = Color( "1", "2", "3", "4" )

                expect( color.r ).to.equal( 1 )
                expect( color.g ).to.equal( 2 )
                expect( color.b ).to.equal( 3 )
                expect( color.a ).to.equal( 4 )
            end
        },

        {
            name = "Accepts negative numbers",
            func = function()
                local color = Color( -100, 0, 255 )

                expect( color.r ).to.equal( -100 )
                expect( color.g ).to.equal( 0 )
                expect( color.b ).to.equal( 255 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Defaults r,g,b,a paramters to 255 if given math.huge",
            func = function()
                local huge = math.huge
                local color = Color( huge, huge, huge, huge )

                expect( color.r ).to.equal( 255 )
                expect( color.g ).to.equal( 255 )
                expect( color.b ).to.equal( 255 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Defaults r,g,b,a paramters to 255 if given nan",
            func = function()
                local nan = 0/0
                local color = Color( nan, nan, nan, nan )

                expect( color.r ).to.equal( 255 )
                expect( color.g ).to.equal( 255 )
                expect( color.b ).to.equal( 255 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Defaults to 255 on alpha if not provided",
            func = function()
                local color = Color( 1, 2, 3 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Fails if not given all parameters",
            func = function()
                expect( Color ).to.errWith( [[bad argument #1 to 'min' (number expected, got nil)]] )
                expect( Color, 1 ).to.errWith( [[bad argument #1 to 'min' (number expected, got nil)]] )
                expect( Color, 1, 2 ).to.errWith( [[bad argument #1 to 'min' (number expected, got nil)]] )
            end
        },

        {
            name = "Fails if not given number (or string number) parameters",
            func = function()
                expect( Color, 0, 255, "blah" ).to.errWith( [[bad argument #1 to 'min' (number expected, got nil)]] )
                expect( Color, "0", "255", "blah" ).to.errWith( [[bad argument #1 to 'min' (number expected, got nil)]] )
            end
        },
    }
}
