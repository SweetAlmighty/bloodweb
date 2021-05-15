require('src/image')

Background = Object:extend()

function Background:new()
    self.nea_position = Vector((screen_width/4)*3, 75)
    self.nea = Animation('nea')
    self.nea:progress()
end

function Background:draw()
    self.nea:draw(self.nea_position.x, self.nea_position.y)
end

function Background:update(dt)
    self.nea:update(dt)
end