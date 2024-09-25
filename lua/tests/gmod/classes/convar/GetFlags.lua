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

                expect( bit.band( flags, FCVAR_GAMEDLL ) ).to.equal( FCVAR_GAMEDLL )
                expect( bit.band( flags, FCVAR_LUA_SERVER ) ).to.equal( FCVAR_LUA_SERVER )
                expect( bit.band( flags, FCVAR_DEMO ) ).to.equal( FCVAR_DEMO )

                if IS_64BIT_BRANCH then
                	expect( bit.band( flags, FCVAR_AVAILABLE2 ) ).to.equal( FCVAR_AVAILABLE2 )
                else
                	expect( bit.band( flags, FCVAR_AVAILABLE2 ) ).toNot.equal( FCVAR_AVAILABLE2 )
                end

                expect( bit.band( flags, FCVAR_UNREGISTERED ) ).toNot.equal( FCVAR_UNREGISTERED )
                expect( bit.band( flags, FCVAR_DEVELOPMENTONLY ) ).toNot.equal( FCVAR_DEVELOPMENTONLY )
                expect( bit.band( flags, FCVAR_CLIENTDLL ) ).toNot.equal( FCVAR_CLIENTDLL )
                expect( bit.band( flags, FCVAR_HIDDEN ) ).toNot.equal( FCVAR_HIDDEN )
                expect( bit.band( flags, FCVAR_PROTECTED ) ).toNot.equal( FCVAR_PROTECTED )
                expect( bit.band( flags, FCVAR_SPONLY ) ).toNot.equal( FCVAR_SPONLY )
                expect( bit.band( flags, FCVAR_ARCHIVE ) ).toNot.equal( FCVAR_ARCHIVE )
                expect( bit.band( flags, FCVAR_NOTIFY ) ).toNot.equal( FCVAR_NOTIFY )
                expect( bit.band( flags, FCVAR_USERINFO ) ).toNot.equal( FCVAR_USERINFO )
                expect( bit.band( flags, FCVAR_PRINTABLEONLY ) ).toNot.equal( FCVAR_PRINTABLEONLY )
                expect( bit.band( flags, FCVAR_UNLOGGED ) ).toNot.equal( FCVAR_UNLOGGED )
                expect( bit.band( flags, FCVAR_NEVER_AS_STRING ) ).toNot.equal( FCVAR_NEVER_AS_STRING )
                expect( bit.band( flags, FCVAR_REPLICATED ) ).toNot.equal( FCVAR_REPLICATED )
                expect( bit.band( flags, FCVAR_CHEAT ) ).toNot.equal( FCVAR_CHEAT )
                expect( bit.band( flags, FCVAR_INTERNAL_USE ) ).toNot.equal( FCVAR_INTERNAL_USE )
                expect( bit.band( flags, FCVAR_DONTRECORD ) ).toNot.equal( FCVAR_DONTRECORD )
                expect( bit.band( flags, FCVAR_LUA_CLIENT ) ).toNot.equal( FCVAR_LUA_CLIENT )
                expect( bit.band( flags, FCVAR_UNREGISTERED ) ).toNot.equal( FCVAR_UNREGISTERED )
                expect( bit.band( flags, FCVAR_RELOAD_MATERIALS ) ).toNot.equal( FCVAR_RELOAD_MATERIALS )
                expect( bit.band( flags, FCVAR_RELOAD_TEXTURES ) ).toNot.equal( FCVAR_RELOAD_TEXTURES )
                expect( bit.band( flags, FCVAR_NOT_CONNECTED ) ).toNot.equal( FCVAR_NOT_CONNECTED )
                expect( bit.band( flags, FCVAR_MATERIAL_SYSTEM_THREAD ) ).toNot.equal( FCVAR_MATERIAL_SYSTEM_THREAD )
                expect( bit.band( flags, FCVAR_ARCHIVE_XBOX ) ).toNot.equal( FCVAR_ARCHIVE_XBOX )
                expect( bit.band( flags, FCVAR_ACCESSIBLE_FROM_THREADS ) ).toNot.equal( FCVAR_ACCESSIBLE_FROM_THREADS )
                expect( bit.band( flags, FCVAR_AVAILABLE1 ) ).toNot.equal( FCVAR_AVAILABLE1 )
                expect( bit.band( flags, FCVAR_SERVER_CAN_EXECUTE ) ).toNot.equal( FCVAR_SERVER_CAN_EXECUTE )
                expect( bit.band( flags, FCVAR_SERVER_CANNOT_QUERY ) ).toNot.equal( FCVAR_SERVER_CANNOT_QUERY )
                expect( bit.band( flags, FCVAR_CLIENTCMD_CAN_EXECUTE ) ).toNot.equal( FCVAR_CLIENTCMD_CAN_EXECUTE )
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