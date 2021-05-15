local peachy = require("lib/peachy/peachy")

Animation = Object:extend()

function Animation:new(name, done_callback)
    self.peachyAnim = peachy.new(
        "assets/json/"..name..".json",
        love.graphics.newImage("assets/imgs/"..name..".png"),
        "Tag"
    )

    self.peachyAnim:pause()

    self.dimensions = Vector(self.peachyAnim:getWidth(), self.peachyAnim:getHeight())

    if self.peachyAnim.direction ~= 'pingpong' then
        local onLoop = 
            function()
                local direction = self.peachyAnim.direction == 'forward'

                self.peachyAnim:pause()
                
                -- Assumes an animation only has one tag.
                self.peachyAnim:setFrame(direction and #self.peachyAnim.tag.frames or 1)

                if done_callback ~= nil then done_callback(direction) end
            end

        self.peachyAnim:onLoop(onLoop)
    end
end

function Animation:draw(x, y, rot, sx, sy, ox, oy)
    self.peachyAnim:draw(x, y, rot, sx, sy, ox, oy)
end

function Animation:update(dt)
    self.peachyAnim:update(dt)
end

function Animation:progress()
    self.peachyAnim.direction = 'forward'
    self.peachyAnim:play()
end

function Animation:regress()
    self.peachyAnim.direction = 'reverse'
    self.peachyAnim:play()
end

function Animation:get_dimensions()
    return self.dimensions
end