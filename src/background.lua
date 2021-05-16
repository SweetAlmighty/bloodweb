Background = Object:extend()

function Background:new()
    self.nea_position = Vector((screen_width/4)*3, 75)
    self.nea = Animation('nea')
    self.nea:progress()

    self.background = Image('Background', Vector(screen_width/2, screen_height/2))
end

function Background:draw()
    self.background:draw()
    self.nea:draw(self.nea_position.x, self.nea_position.y)
end

function Background:update(dt)
    self.nea:update(dt)
end