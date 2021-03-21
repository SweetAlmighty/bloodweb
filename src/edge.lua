--local util = require('src/util')

Edge = Object:extend()

function Edge:new(from, to)
    self.connections = { from, to }
        
    self.stem = Animation('stem')
    self.position = from:get_position()
    self.dimension = self.stem:get_dimensions()

    local toPos = to:get_position()
    local direction = (self.position - toPos).normalized

    self.angle = util.lookAt(Vector(self.position.x, 400), toPos, self.position)

    -- Push back into center
    self.position = self.position + (15 * -direction)
end

function Edge:update(dt)
    self.stem:update(dt)
end

function Edge:GetNode(index)
    return self.connections[index]
end

function Edge:draw()
    self.stem:draw(self.position.x, self.position.y, self.angle, 1, 1, self.dimension.x/2, 0)
end

function Edge:update(dt)
    self.stem:update(dt)
end