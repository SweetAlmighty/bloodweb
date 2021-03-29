require('src/animation')
require('src/item_box')

Node = Object:extend()

function Node:new(x, y)
    self.directions = { }
    self.connections = { }
    self.mouse_down = false
    self.position = Vector(x, y)
    self.drawable = Animation('circle',
        function(forward)
            self.node_full = forward
            if not forward then
                self.edge:on_mouse_up(true)
            end
        end
    )

    self.max_edges = util.randomChoice({ 1, 2 })
    self.dimension = self.drawable:get_dimensions()

    self.circle = {
        x = x,
        y = y,
        radius = 16
    }

    self.item_box = ItemBox(x, y)
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
    self.item_box:draw()
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


function Node:selected(x, y)
    return util.pointInCircle(x, y, self.circle) and self.connections[1]:is_full()
end

function Node:on_mouse_down()--x, y)
    self.drawable:progress()
end

function Node:on_mouse_up()
    if not self.node_full then
        self.drawable:regress()
    end
end