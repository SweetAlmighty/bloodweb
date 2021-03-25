require('src/Animation')

Node = Object:extend()

function Node:new(x, y)
    self.directions = { }
    self.connections = { }
    self.mouse_down = false
    self.position = Vector(x, y)
    self.drawable = Animation('circle',
        function(forward)
            self.full = forward
            if not forward then
                self.edge:set_shit(true)
                self.edge:on_mouse_up()
            end
        end
    )
    self.max_edges = util.randomChoice({ 1, 2, 3 })
    self.dimension = self.drawable:get_dimensions()

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

function Node:add_connection(node, direction, edge)
    self.edge = edge
    self.connections[#self.connections+1] = node
    self.directions[#self.directions+1] = direction
    
    self:rotate_towards(node)
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

function Node:set_full(full)
    self.full = full 
end

function Node:is_full()
    return self.full
end

function Node:selected(x, y)
    return util.pointInCircle(x, y, self.circle) and self.connections[1]:is_full()
end

function Node:on_mouse_down(x, y)
    self.drawable:progress()
end

function Node:on_mouse_up()
    if not self.full then
        self.drawable:regress()
    end
end