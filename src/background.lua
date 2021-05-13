require('src/image')

Background = Object:extend()

function Background:new()
    --self.nea = Image('nea', Vector((screen_width/4)*3, screen_height/2))
    self.nea = Animation('nea_anim',
        function(forward)
            if forward then
                self.nea:regress()
            else
                self.nea:progress()
            end
        end
    )
    self.nea:progress()
end

function Background:draw()
    self.nea:draw((screen_width/4)*3, screen_height/2)
end

function Background:update(dt)
    self.nea:update(dt)
end