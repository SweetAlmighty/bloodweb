local peachy = require("library/peachy/peachy")

Animation = Object:extend();

function Animation:new(name, done_callback)
    self.isUpdating = false;
    self.peachyAnim = peachy.new(
        "assets/json/"..name..".json",
        love.graphics.newImage("assets/imgs/"..name..".png"),
        "Tag"
    );
    
    self.dimensions = Vector(self.peachyAnim:getWidth(), self.peachyAnim:getHeight())

    self.peachyAnim:onLoop(
        function()
            local direction = self.peachyAnim.direction == 'forward';

            self.isUpdating = false;
            self.peachyAnim:setFrame(direction and 33 or 1);

            if done_callback ~= nil then done_callback(direction); end
        end
    );
end

function Animation:draw(x, y, rot, sx, sy, ox, oy)
    self.peachyAnim:draw(x, y, rot, sx, sy, ox, oy);
end

function Animation:update(dt)
    if self.isUpdating then
        self.peachyAnim:update(dt);
    end
end

function Animation:progress()
    self.isUpdating = true;
    self.peachyAnim.direction = 'forward';
end

function Animation:regress()
    self.peachyAnim.direction = 'reverse';
end

function Animation:get_dimensions()
    return self.dimensions;
end

function Animation:is_updating()
    return self.isUpdating;
end