Edge = Object:extend();

require('src/animation');
local util = require('src/util');

--[[
local animDone = false;
local done = function(direction)
    animDone = true;
end
]]

function Edge:new(to, from)
    self.nodes = { to, from }
    self.stem = Animation('stem');
    self.position = to:get_position();
    self.dimension = self.stem:get_dimensions();

    local fromPos = from:get_position();
    local direction = (self.position - fromPos).normalized;

    self.angle = util.lookAt(Vector(self.position.x, 400), fromPos, self.position);

    -- Push back into center
    self.position = self.position + (15 * -direction)
end

function Edge:update(dt)
    self.stem:update(dt);
end

function Edge:GetNode(index)
    return self.nodes[index];
end

function Edge:draw()
    self.stem:draw(self.position.x, self.position.y, self.angle, 1, 1, self.dimension.x/2, 0);
end