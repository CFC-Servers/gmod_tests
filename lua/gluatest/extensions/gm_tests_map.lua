--- @class TestMap
TestMap = {
    --- @type table<string, Entity>
    rooms = {},
}

--- Parses the given node as a Room node
--- @param name string The name of the node
--- @param node Entity
function TestMap:ParseRoom( name, node )
    self.rooms[name] = node
end

--- Gets a room by name
--- @param name string The name of the room
function TestMap:GetRoom( name )
    local room = self.rooms[name]
    assert( room, "Room '" .. name .. "' not found!" )

    return room
end

--- Parses all info nodes on the map
function TestMap:ParseNodes()
    for _, node in ipairs( ents.FindByClass( "info_target" ) ) do
        local name = node:GetName()

        -- Rooms
        if string.find( name, "room" ) then
            self:ParseRoom( name, node )
        end
    end
end

TestMap:ParseNodes()
