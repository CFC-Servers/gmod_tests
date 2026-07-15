--- @type GLuaTest_TestGroup
return {
    groupName = "string.NiceSize",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.NiceSize ).to.beA( "function" )
            end
        },

        {
            name = "Formats byte counts below one thousand as Bytes",
            func = function()
                local bytes = string.NiceSize( 64 )
                expect( bytes ).to.equal( "64 Bytes" )

                local justUnder = string.NiceSize( 999 )
                expect( justUnder ).to.equal( "999 Bytes" )
            end
        },

        {
            name = "Formats zero without a unit",
            func = function()
                local zero = string.NiceSize( 0 )
                expect( zero ).to.equal( "0" )
            end
        },

        {
            name = "Scales units by 1000 rather than 1024",
            func = function()
                local atThousand = string.NiceSize( 1000 )
                expect( atThousand ).to.equal( "1 KB" )

                local atKibibyte = string.NiceSize( 1024 )
                expect( atKibibyte ).to.equal( "1.02 KB" )
            end
        },

        {
            name = "Formats each unit tier with two decimals",
            func = function()
                local kilobytes = string.NiceSize( 64512 )
                expect( kilobytes ).to.equal( "64.51 KB" )

                local megabytes = string.NiceSize( 64512000 )
                expect( megabytes ).to.equal( "64.51 MB" )

                local gigabytes = string.NiceSize( 64512000000 )
                expect( gigabytes ).to.equal( "64.51 GB" )
            end
        },

        {
            name = "Has no unit tier above gigabytes",
            func = function()
                local terabyte = string.NiceSize( 1099511627776 )
                expect( terabyte ).to.equal( "1099.51 GB" )
            end
        },

        {
            name = "Formats negative sizes as zero",
            func = function()
                local negative = string.NiceSize( -64512000000 )
                expect( negative ).to.equal( "0" )
            end
        },

        {
            name = "Accepts numeric strings",
            func = function()
                local fromString = string.NiceSize( "2048" )
                expect( fromString ).to.equal( "2.05 KB" )
            end
        },

        {
            name = "Errors on non-numeric inputs",
            func = function()
                expect( string.NiceSize, nil ).to.errWith( "attempt to compare nil with number" )
                expect( string.NiceSize, NULL ).to.errWith( "attempt to compare nil with number" )
                expect( string.NiceSize, "string" ).to.errWith( "attempt to compare nil with number" )
            end
        }
    }
}
