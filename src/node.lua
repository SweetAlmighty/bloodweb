require('src/Animation')

Node = Object:extend()

function Node:new(x, y)
    self.directions = { }
    self.connections = { }
    self.mouse_down = false
    self.position = Vector(x, y)
    self.drawable = Animation('circle')
    self.dimension = self.drawable:get_dimensions()
    self.max_edges = util.randomChoice({ 1, 2, 3 })

    self.circle = {
        x = x,
        y = y,
        radius = 16
    }
end

function Node:rotate_towards(to)
    local toPos = to:get_position()
    self.rotation = util.lookAt(Vector(self.position.x, 400), toPos, self.position)
end

function Node:add_connection(node, direction, stem)
    self.stem = stem
    self.directions[#self.directions+1] = direction
    self.connections[#self.connections+1] = node
end

function Node:draw()
    self.drawable:draw(self.position.x, self.position.y, self.rotation, 1, 1, self.dimension.x/2, self.dimension.y/2)
end

function Node:update(dt) self.drawable:update(dt) end

function Node:get_position() return self.position end

function Node:determine_direction()
    if #self.connections == self.max_edges then return nil end

    local direction = util.determineDirection()

    for _, v in pairs(self.directions) do
        if v == direction then return nil end
    end

    self.directions[#self.directions+1] = direction

    return self.directions[#self.directions]
end

--local stem_done = false
--function Node:on_stem_done()
--    stem_done = true
--end

function Node:on_mouse_down(x, y)
    self.mouse_down = true
    if util.pointInCircle(x, y, self.circle) then
        --if stem_done then
            self.drawable:progress()
        --else
        --    self.stem:on_mouse_down()
        --end
    end
end

function Node:on_mouse_up()
    self.mouse_down = false
    self.drawable:regress()
end