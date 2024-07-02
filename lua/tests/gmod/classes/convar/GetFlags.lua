return {
    groupName = "ConVar:GetFlags",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.GetFlags ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()
                local flags = a:GetFlags()

                local function check( flag )
                    return bit.band( flags, flag )
                end

                expect( check( FCVAR_GAMEDLL ) ).to.equal( FCVAR_GAMEDLL )
                expect( check( FCVAR_LUA_SERVER ) ).to.equal( FCVAR_LUA_SERVER )
                expect( check( FCVAR_DEMO ) ).to.equal( FCVAR_DEMO )
                expect( check( FCVAR_UNREGISTERED ) ).toNot.equal( FCVAR_UNREGISTERED )
                expect( check( FCVAR_DEVELOPMENTONLY ) ).toNot.equal( FCVAR_DEVELOPMENTONLY )
                expect( check( FCVAR_CLIENTDLL ) ).toNot.equal( FCVAR_CLIENTDLL )
                expect( check( FCVAR_HIDDEN ) ).toNot.equal( FCVAR_HIDDEN )
                expect( check( FCVAR_PROTECTED ) ).toNot.equal( FCVAR_PROTECTED )
                expect( check( FCVAR_SPONLY ) ).toNot.equal( FCVAR_SPONLY )
                expect( check( FCVAR_ARCHIVE ) ).toNot.equal( FCVAR_ARCHIVE )
                expect( check( FCVAR_NOTIFY ) ).toNot.equal( FCVAR_NOTIFY )
                expect( check( FCVAR_USERINFO ) ).toNot.equal( FCVAR_USERINFO )
                expect( check( FCVAR_PRINTABLEONLY ) ).toNot.equal( FCVAR_PRINTABLEONLY )
                expect( check( FCVAR_UNLOGGED ) ).toNot.equal( FCVAR_UNLOGGED )
                expect( check( FCVAR_NEVER_AS_STRING ) ).toNot.equal( FCVAR_NEVER_AS_STRING )
                expect( check( FCVAR_REPLICATED ) ).toNot.equal( FCVAR_REPLICATED )
                expect( check( FCVAR_CHEAT ) ).toNot.equal( FCVAR_CHEAT )
                expect( check( FCVAR_INTERNAL_USE ) ).toNot.equal( FCVAR_INTERNAL_USE )
                expect( check( FCVAR_DONTRECORD ) ).toNot.equal( FCVAR_DONTRECORD )
                expect( check( FCVAR_LUA_CLIENT ) ).toNot.equal( FCVAR_LUA_CLIENT )
                expect( check( FCVAR_UNREGISTERED ) ).toNot.equal( FCVAR_UNREGISTERED )
                expect( check( FCVAR_RELOAD_MATERIALS ) ).toNot.equal( FCVAR_RELOAD_MATERIALS )
                expect( check( FCVAR_RELOAD_TEXTURES ) ).toNot.equal( FCVAR_RELOAD_TEXTURES )
                expect( check( FCVAR_NOT_CONNECTED ) ).toNot.equal( FCVAR_NOT_CONNECTED )
                expect( check( FCVAR_MATERIAL_SYSTEM_THREAD ) ).toNot.equal( FCVAR_MATERIAL_SYSTEM_THREAD )
                expect( check( FCVAR_ARCHIVE_XBOX ) ).toNot.equal( FCVAR_ARCHIVE_XBOX )
                expect( check( FCVAR_ACCESSIBLE_FROM_THREADS ) ).toNot.equal( FCVAR_ACCESSIBLE_FROM_THREADS )
                expect( check( FCVAR_AVAILABLE1 ) ).toNot.equal( FCVAR_AVAILABLE1 )
                expect( check( FCVAR_SERVER_CAN_EXECUTE ) ).toNot.equal( FCVAR_SERVER_CAN_EXECUTE )
                expect( check( FCVAR_SERVER_CANNOT_QUERY ) ).toNot.equal( FCVAR_SERVER_CANNOT_QUERY )
                expect( check( FCVAR_CLIENTCMD_CAN_EXECUTE ) ).toNot.equal( FCVAR_CLIENTCMD_CAN_EXECUTE )
            end
        },

        {
            name = "FCVAR_AVAILABLE2 is present (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local a = GetTestConVar()
                local flags = a:GetFlags()

                expect( bit.band( flags, FCVAR_AVAILABLE2 ) ).to.equal( FCVAR_AVAILABLE2 )
            end
        },

        {
            name = "FCVAR_AVAILABLE2 is not present (base)",
            when = IS_BASE_BRANCH,
            func = function()
                local a = GetTestConVar()
                local flags = a:GetFlags()

                expect( bit.band( flags, FCVAR_AVAILABLE2 ) ).toNot.equal( FCVAR_AVAILABLE2 )
            end
        },
    }
}
