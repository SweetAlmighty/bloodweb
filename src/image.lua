Image = Object:extend()

function Image:new(name, position)
    self.position = position
    self.image = love.graphics.newImage("assets/imgs/"..name..".png")
    self.image:setFilter("nearest", "nearest")
    
    self.offset = Vector(self.image:getWidth(), self.image:getHeight())/2
end

function Image:draw()
    love.graphics.draw(self.image, self.position.x - self.offset.x, self.position.y - self.offset.y)
end

function Image:set_position(x, y)
    self.position = Vector(x, y)
end